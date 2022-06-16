Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56E3C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5261DC341C5; Thu, 16 Jun 2022 00:48:26 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17846C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17846C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id x138so79750pfc.12
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T8QZHlvVWLrvIQOydu6CCD5mHZxumuDa9jo1Phsr+pg=;
        b=J6oH+8YYpna2UuHlngoqbHlwOsqW317xprlm/D07O66XsGayhzATd619ZfLT40ZHgc
         gpSo++zbhpPiBXAbcrTF5C260ftStA8HzYy+qi29my7l6eG/6XdHtYcphMJwr6+0xPZT
         SGhi6wNMPOwB317byRy7gfNQ/0TMtcf8Km3cTcXxT0rV3w9dqNJFycBMXM9Ix/j17HXY
         tiuhgEnK4PkvOjQ0DlCUQJVGnva3IlAhhOCPXzVf/m3n1uoFlL7Gonn4md8YLFbP9481
         ceTa+98gpt1VkSK1Li6+y5lXC8gKkjkFZ63Ioj8dkJaYpIMjjbjyngCVrzr6MyUh4vqx
         epAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T8QZHlvVWLrvIQOydu6CCD5mHZxumuDa9jo1Phsr+pg=;
        b=6jeaE0D+VgiyuGVbXazhV7s0LFJVUUa02uKnkTYumrX8w9O16mZEO+J70tvvWT7rFK
         k3sz5dxVBNv8u2MauZv8iIdn5ZEpNA3tcVGRgsr1BViWF356qXlTNalxSEM3FJFu7CMs
         32YoYNUhsll9l+ZKf1AH3GG4Or7nOhJxE0ZuQz4VBQyQ23jOURCkFTJJ+QY8jRYcPD5z
         XxSW7Iuo0saSY/3Cf4zgQmK6Z2PIAllOawt6C2kETGl7d9YicP/3IYO6B6vYTNf/tUR7
         Fzsp7i6NDS0iMXkzzTKxdMgZVuUYX+5qkbRT+9HQNxKS+4S2IU6yAfqwrRpmc0b5oIpM
         lPog==
X-Gm-Message-State: AJIora/IZuWTUk5p0C6i6d3P2ISnqdj31wUJWOZHu9W2UN7FikZ2Pi9+
	UQ7vL+IkuAbdfBx1TMRJ6pZRfQ==
X-Google-Smtp-Source: AGRyM1szfmFZxpBJgOkiIjn8nao0a7mgAaoEx/fSfpRRabavFTJbCHNmOH+rE/C6+TNI05JocHHG3A==
X-Received: by 2002:a63:3502:0:b0:40b:916a:9b19 with SMTP id c2-20020a633502000000b0040b916a9b19mr4859pga.33.1655340504518;
        Wed, 15 Jun 2022 17:48:24 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902684b00b001635c9e7f77sm253518pln.57.2022.06.15.17.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:48:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	soc@kernel.org
Subject: Re: (subset) [PATCH v2 47/48] ARM: dts: exynos: align gpio-key node names with dtschema
Date: Wed, 15 Jun 2022 17:48:21 -0700
Message-Id: <165534049852.17040.1588652474876774936.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609114047.380793-8-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609114047.380793-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 9 Jun 2022 13:40:46 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[47/48] ARM: dts: exynos: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/97a9495efbdc5184930a75d36ca845d578e3ee1b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
