Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8CEC43334
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D10AC3411C; Wed,  8 Jun 2022 09:13:02 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C30CEC34116;
	Wed,  8 Jun 2022 09:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C30CEC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id c18so10010708pgh.11;
        Wed, 08 Jun 2022 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YCm71yQ1aHpppu7Qyx6KCYcqHhXcfD7GUUOanT5OZB8=;
        b=n2MQ1YWh+m9tYO0E1/8JFp/WJnfEwBHe1fPWeoTwaa2oLXU6rYqy58k/JSXLdhmbTP
         v377y1QSjCtF4kaTv98GdxaNiqjndEacbxV4hWIYw5bXOZTSHfWPZJbVrRsLne7kH8iF
         GOhd0Yy934+obIyyNKJtev8077nPfzvNTpnZuqWllgh2mRHpk+WxNzBtWUIOdLZNkkMD
         21imI3m/KfwsrsZ+L+8XKcj0n2UzPcRI9QCQjX6w/GaDXZhdH5t2T2A+N50+6VVb5j96
         H53r1xKrQk56ly8bYrobw8mpJYs0C6W4RfUB5jC+Fu3Byijh7SF4saqi7a4McwGEVWx8
         MKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCm71yQ1aHpppu7Qyx6KCYcqHhXcfD7GUUOanT5OZB8=;
        b=0KQrsmb2gtpHZtfbzRYOZBJD4sTlhpEESD50Xs7kDusuQzyXSHDKz+0UfWdZHvnTSK
         zpQvlGtDvrks9tHkN3o+23z2VQZod5fdlVicFPBvyTGizl2FXHAfl+d1DOGaPhV73iek
         6gudBmhPea440tm5LTI4xQ4oB+j6MUws3PU/DORm+C4P1jztoVj8aD9AuJTyAqWf0jMc
         qZzVapuvBKKjyhND2pDC6/+5cYAgwNdC78Ss5Mr8jddgJZS4GXtA/hMj5NCOMFCZIJ5O
         Whf5/VYWtvWeT24CWMMFOj918cl0ibftj8XjaoVvh2TnmGKKCc3y/utFOOIHsJWfrESv
         UvSQ==
X-Gm-Message-State: AOAM530BKqS3dwFZ920VCnVq4B9KA0PD8P131YwV7jxLO1L1i78fWrsK
	7f2NeDX285RLT0QRVahH+3M=
X-Google-Smtp-Source: ABdhPJwMoASgcHZ4y9He5hVn/vbAHm06vaoj2PR63DBVd0tSjst4qdg8tCVyebIXcechZp6MvTM+mg==
X-Received: by 2002:a63:8641:0:b0:3fd:94e8:a650 with SMTP id x62-20020a638641000000b003fd94e8a650mr15472183pgd.367.1654679581178;
        Wed, 08 Jun 2022 02:13:01 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w16-20020a1709026f1000b001635c9e7f77sm13639515plk.57.2022.06.08.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 02:13:00 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: broadcom: adjust whitespace around '='
Date: Wed,  8 Jun 2022 02:12:58 -0700
Message-Id: <20220608091259.1461365-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526204339.832296-2-krzysztof.kozlowski@linaro.org>
References: <20220526204339.832296-1-krzysztof.kozlowski@linaro.org> <20220526204339.832296-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:43:39 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
