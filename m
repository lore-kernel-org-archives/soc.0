Return-Path: <SRS0=14BC=WJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DBAC433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 06:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FCB7C34114; Thu,  2 Jun 2022 06:41:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D06BC36AE2
	for <soc@kernel.org>; Thu,  2 Jun 2022 06:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D06BC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id rs12so8009539ejb.13
        for <soc@kernel.org>; Wed, 01 Jun 2022 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xh40FdUZDHp56lt1mcZYv6mF79rHnUUf6QlRZkakiWo=;
        b=jjIbor3W9EkaLy33DYrUnVBgkcSocnbd9VJYFqQSnTlQS2pqJbn+n+0Y4LjdKoOac4
         uTi5swn54aSkW0DcJ3ZD7xRk2qOVay7degnIXit1xEj5VqiLl1216O+qXRGQzwNIrB+i
         53kRUkaYHKYw8RINS7+qDDTlPtjuaaYVb4OLgB1eIgxo6Vg8hKv8XpdL1x7kavw2YKBS
         SiJtxUALKQYE2ln82KD3kVQAf0utgcOugzRyHd+o90fs91RlpEgWi1hwgJwpABh+koKd
         2cQJ5gnPwhoZWZf0pZRuDoZQmO+TP9kVvskZszM831f+sENnkvzDpVqp9Y6yBSb19mUS
         7Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xh40FdUZDHp56lt1mcZYv6mF79rHnUUf6QlRZkakiWo=;
        b=0vOoWhhRzsX9SimuMLmhx7wLMVJbdyDlU8lyJp3AS/Ex5CvpGkxczbIn0Beu+NEf5r
         dLvVmEAmJFS9JdFMDbmbN8/qMDIZPkGXf+qMWvzzcmUVV6/IilG1JteJWVLIpEQVhryh
         BGHwqjdxz0al3Y0TO4ZndL0QL8FVzpkz/Le+3VL/K9J+8EdsGcOiewsqAU9J+MqNH5/e
         lUtZKjhtQq0kKy5YHY2U1vUUIMRvHv6nVYcQJMyT5jxh8xkOPy042Yg56RDb9EN9UB79
         hfYCbOTjakq0PpFdCg215XvN2zxKan0oQIVhiv5dJZIBxbLFB4Hql8qPHblA9bn5SigG
         Nu9A==
X-Gm-Message-State: AOAM533EpmAeCGj9LMmXcVk8lbDuV7lRSzhjxxlKzWJTV0fIEaW4Lz8p
	Peuz9EHf0oQlcKpMof6QCt4YJg==
X-Google-Smtp-Source: ABdhPJyaEB7WoRZ4YQcuTAOTfh31tzpYBulRNx0UClyWBZu0z/z0FJib+4lc9BcDTyXlnWjdhsfqNQ==
X-Received: by 2002:a17:907:6e08:b0:6fe:d99b:8fc with SMTP id sd8-20020a1709076e0800b006fed99b08fcmr2913931ejc.230.1654152083647;
        Wed, 01 Jun 2022 23:41:23 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p19-20020a056402155300b0042617ba638esm2016394edx.24.2022.06.01.23.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:41:23 -0700 (PDT)
Message-ID: <2cc7effd-7956-1b09-9faf-585cf3b75734@linaro.org>
Date: Thu, 2 Jun 2022 08:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 4/5] ARM: dts: socfpga: Add Google Chameleon v3
 devicetree
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org, amstan@chromium.org,
 upstream@semihalf.com
References: <20220601154647.80071-1-pan@semihalf.com>
 <20220601154647.80071-5-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601154647.80071-5-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2022 17:46, Paweł Anikiel wrote:
> Add devicetree for the Google Chameleon v3 board.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
