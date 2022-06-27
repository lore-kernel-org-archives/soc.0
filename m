Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872A5C433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70EDAC341C7; Mon, 27 Jun 2022 09:16:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D194AC341CB
	for <soc@kernel.org>; Mon, 27 Jun 2022 09:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D194AC341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id e40so12068604eda.2
        for <soc@kernel.org>; Mon, 27 Jun 2022 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XF6Xg/Jnl8kt9uAg84iyOeyFwLxeYnsquIkcVeggWYM=;
        b=gVRDJ4vFWvupd6MuehuV0OUebq18DZ62ha0FXRq7baNiTZPWnsnrnfv2JiiMMXw0/P
         aq2YqANeuOuygVdGNwMoBPze1cocTo+jEUy6xQ5DpT4cIG2qYl/L1nIJ/yjesuGCuw1s
         Oqvbg+bwvwF8XQg6kgsv7gtx8NpfBkKXGUAggE7ls8xUdmJZ08WPcIond8WjnY6cfGqO
         5ijvAcc9LJBHhTZiQT4wN0WTFlnzlhyqzZIU+1R1WvRQf0ErqwiaZHrJU/Pi4xQXYY30
         Rx6pyW9FORlokQPDz8vRXHqCPLF2JH3YasCcRgUSaTKmSVRHmy9f6qQR9X7QBE33/qRN
         MTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XF6Xg/Jnl8kt9uAg84iyOeyFwLxeYnsquIkcVeggWYM=;
        b=6Na25X2cy6Pa6RCUXEtlVdv4VM/O82dALPcbEybGQAoiJUaVyy/xFRJQiu6P5Yxh8M
         +rXyGFZX/xVZm6Lu0g4omffznAW/qvZ0rhmO7dbcw9buPVlvgo1ElkV4RsVT2VrruUsk
         5PunbSZQ+W3cE2Ulq/L818/o1Ou+Nqv+bZhnbzRdGnTGiI46E8kckygYC03KTuUvd0iD
         QDRatdsLe9wTP6I3o9XOG/Rh0sbfGG0gAHmrPa1m4iFnIEg5aAnc0vq15A3i40IlN9n5
         4VOtPsDYTBb+GddnkWbdK0cm0mRJk4jr3U+v81DumcxAvGgdY5aOpNIe7g7pfDfgi1Hu
         5Vlw==
X-Gm-Message-State: AJIora9BxQWl6DRzW2C+dt+R4cztaCWiM+OQZqfxunhz0JP0+hKygZpX
	XgNbdHiFefEoIcgcQ81kC7irQJv26bxI2A==
X-Google-Smtp-Source: AGRyM1s7wLhckQWmZ8cCf38jqWGxYIOfzLPfzkkajYqwvs940PONwvnPw2NxqZOSDMwfCTLrRTgmUA==
X-Received: by 2002:a05:6402:510a:b0:435:bcb8:756d with SMTP id m10-20020a056402510a00b00435bcb8756dmr14569504edd.277.1656321366851;
        Mon, 27 Jun 2022 02:16:06 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org,
	brgl@bgdev.pl,
	bcousson@baylibre.com,
	nsekhar@ti.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	marc.murphy@sancloud.com,
	paul.barker@sancloud.com,
	arm@kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net
Subject: Re: (subset) [PATCH 2/3] ARM: dts: ti: adjust whitespace around '='
Date: Mon, 27 Jun 2022 11:15:42 +0200
Message-Id: <165632135504.81841.11888116255808550872.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204139.831895-2-krzysztof.kozlowski@linaro.org>
References: <20220526204139.831895-1-krzysztof.kozlowski@linaro.org> <20220526204139.831895-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:41:37 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[2/3] ARM: dts: ti: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/ae25b445914a754a74133021d39fc51261493ac8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
