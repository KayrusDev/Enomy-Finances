package com.enomyfinances.service;

import com.enomyfinances.entity.CurrencyExchange;
import com.enomyfinances.entity.User;
import com.enomyfinances.repository.CurrencyExchangeRepository;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;

@Service
public class CurrencyExchangeServiceImpl implements CurrencyExchangeService {
    
    private final CurrencyExchangeRepository currencyExchangeRepository;

    public CurrencyExchangeServiceImpl(CurrencyExchangeRepository currencyExchangeRepository) {
        this.currencyExchangeRepository = currencyExchangeRepository;
    }

    @Override
    public CurrencyExchange processExchange(CurrencyExchange currencyExchange) {
        BigDecimal exchangeRate = getExchangeRate(
            currencyExchange.getFromCurrency(), 
            currencyExchange.getToCurrency()
        ).setScale(2, RoundingMode.HALF_UP);

        BigDecimal convertedAmount = currencyExchange.getOriginalAmount()
            .multiply(exchangeRate)
            .setScale(2, RoundingMode.HALF_UP);

        BigDecimal feePercentage = getFeePercentage(currencyExchange.getOriginalAmount());

        BigDecimal feeAmount = convertedAmount
            .multiply(feePercentage)
            .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);

        BigDecimal finalAmount = convertedAmount
            .subtract(feeAmount)
            .setScale(2, RoundingMode.HALF_UP);

        currencyExchange.setExchangeRate(exchangeRate);
        currencyExchange.setConvertedAmount(convertedAmount);
        currencyExchange.setFeePercentage(feePercentage);
        currencyExchange.setFeeAmount(feeAmount);
        currencyExchange.setFinalAmount(finalAmount);

        return currencyExchangeRepository.save(currencyExchange);
    }

    private BigDecimal getExchangeRate(String fromCurrency, String toCurrency) {
        // Static exchange rates (example values)
        Map<String, BigDecimal> rates = Map.ofEntries(
            Map.entry("GBP-USD", BigDecimal.valueOf(1.27)),
            Map.entry("GBP-EUR", BigDecimal.valueOf(1.15)),
            Map.entry("GBP-BRL", BigDecimal.valueOf(6.35)),
            Map.entry("GBP-JPY", BigDecimal.valueOf(185.50)),
            Map.entry("GBP-TRY", BigDecimal.valueOf(40.20)),
            Map.entry("USD-GBP", BigDecimal.valueOf(0.79)),
            Map.entry("USD-EUR", BigDecimal.valueOf(0.91)),
            Map.entry("USD-BRL", BigDecimal.valueOf(5.02)),
            Map.entry("USD-JPY", BigDecimal.valueOf(146.20)),
            Map.entry("USD-TRY", BigDecimal.valueOf(33.00)),
            Map.entry("EUR-GBP", BigDecimal.valueOf(0.87)),
            Map.entry("EUR-USD", BigDecimal.valueOf(1.10)),
            Map.entry("EUR-BRL", BigDecimal.valueOf(5.50)),
            Map.entry("EUR-JPY", BigDecimal.valueOf(160.00)),
            Map.entry("EUR-TRY", BigDecimal.valueOf(35.80)),
            Map.entry("BRL-GBP", BigDecimal.valueOf(0.16)),
            Map.entry("BRL-USD", BigDecimal.valueOf(0.20)),
            Map.entry("BRL-EUR", BigDecimal.valueOf(0.18)),
            Map.entry("BRL-JPY", BigDecimal.valueOf(29.50)),
            Map.entry("BRL-TRY", BigDecimal.valueOf(6.50)),
            Map.entry("JPY-GBP", BigDecimal.valueOf(0.0054)),
            Map.entry("JPY-USD", BigDecimal.valueOf(0.0068)),
            Map.entry("JPY-EUR", BigDecimal.valueOf(0.0063)),
            Map.entry("JPY-BRL", BigDecimal.valueOf(0.034)),
            Map.entry("JPY-TRY", BigDecimal.valueOf(0.22)),
            Map.entry("TRY-GBP", BigDecimal.valueOf(0.025)),
            Map.entry("TRY-USD", BigDecimal.valueOf(0.030)),
            Map.entry("TRY-EUR", BigDecimal.valueOf(0.028)),
            Map.entry("TRY-BRL", BigDecimal.valueOf(0.15)),
            Map.entry("TRY-JPY", BigDecimal.valueOf(4.50))
        );

        return rates.getOrDefault(fromCurrency + "-" + toCurrency, BigDecimal.ONE);
    }
    
    @Override
    public List<CurrencyExchange> getAllExchanges() {
        return currencyExchangeRepository.findAll();
    }


    private BigDecimal getFeePercentage(BigDecimal amount) {
        if (amount.compareTo(BigDecimal.valueOf(2500)) > 0) {
            return BigDecimal.valueOf(1.5);
        } else if (amount.compareTo(BigDecimal.valueOf(1500)) > 0) {
            return BigDecimal.valueOf(2.0);
        } else if (amount.compareTo(BigDecimal.valueOf(500)) > 0) {
            return BigDecimal.valueOf(2.7);
        } else {
            return BigDecimal.valueOf(3.5);
        }
    }

    @Override
    public List<CurrencyExchange> findExchangesByUser(User user) {
        return currencyExchangeRepository.findByUserOrderByTransactionDateDesc(user);
    }

}
