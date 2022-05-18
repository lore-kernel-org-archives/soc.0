Return-Path: <SRS0=aCAB=V2=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA9C433F5
	for <soc@archiver.kernel.org>; Wed, 18 May 2022 20:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D9A4C34113; Wed, 18 May 2022 20:02:05 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DF2BC385A5;
	Wed, 18 May 2022 20:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DF2BC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id h186so3101203pgc.3;
        Wed, 18 May 2022 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uqfL2s98jH1KESGEpAYrkz2to9znSXHw/vJwfe+b5DQ=;
        b=YPVYxFEAxbX9obB0FWsDGjJXZ/xxu0R1tZCQ++6jkOoiO9v559/ECYd0+e/O2SnKIk
         DbDtz5cgKxPzpnH+uyTvilV8s6IbwTs4inX3uNdgLPM27TDRwtSHqzOkWpM4ch8gryT6
         AndZRKGF8eXDvaO0E1zoLXJPNO6Ebt5P/rxP9ZuAXcMrgVMTjvDJF86e5CEcHX8KrPw/
         zt7qqK+70VExBruwYUmRAm7vJNPaBCZEsnDJLYVUSF6gdpChcgPc4WS0zJ2AW2KogD1E
         d1OEEibKD/Kdsl7l97xR9MOMSbaCdf0VI39+UCXcEtWW6z7FeXiHJvzIqe/8nYP79cFt
         BP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uqfL2s98jH1KESGEpAYrkz2to9znSXHw/vJwfe+b5DQ=;
        b=lMk+85fDuKi7LmcqM7nGn5HauZHen5jEGyIGGolWeg1MbdFkJuNXKmx4qqDVOaG3R0
         oWF/whGJ/2Awr7LBuQLiE6gGYmoUUDKd0l9Gj0dSH26ORl0z+zCNIl6frQCUKX+PFmLS
         WYsksXjPVTmjUGolzjZ5kf0OlG44xv04XNEp+NYPNiHsE8seCAMtWSZxSYWBMEdBfKan
         FylH29vwzimThSavPjo2/H9oFhG0BGj4BpOAphn8HfEMJ76vISK+eWHQ+eOjR9CXr3k5
         vy68dYeKi/fcfKTNhnJNgxSZ9LwJJ5X1JYyb2Cj/zFm8sdl0UkMKT3wrdq2C5b1YoR1K
         wX8w==
X-Gm-Message-State: AOAM530D1TTnWlrzVvEEg0QNYfgNJewFox+jfi+n1aGKnGIiR3kNoqzT
	w8jK4DBrCg4XeqAqV/HF8U40TzleiSs=
X-Google-Smtp-Source: ABdhPJyr9iaeXPnDbGCFTOGnkaD+p+nR2I1pLBS5V7XERkYPJllYvgGbkhSs6RXFm2TYStgbhdRVbQ==
X-Received: by 2002:a65:6919:0:b0:3f6:111c:42d0 with SMTP id s25-20020a656919000000b003f6111c42d0mr881634pgq.449.1652904123979;
        Wed, 18 May 2022 13:02:03 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090a9a8b00b001df4c27e5a5sm3961678pjp.35.2022.05.18.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:02:03 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Anand Gore <anand.gore@broadcom.com>,
	linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: dan.beygelman@broadcom.com,
	joel.peshkin@broadcom.com,
	florian.fainelli@broadcom.com,
	kursad.oney@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: add dts files for bcmbca soc 63178
Date: Wed, 18 May 2022 13:02:01 -0700
Message-Id: <20220518200201.323063-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516103801.1.If6875f219ec3c728983c6aec498ef67b43cef8b7@changeid>
References: <20220516173808.1391482-1-anand.gore@broadcom.com> <20220516103801.1.If6875f219ec3c728983c6aec498ef67b43cef8b7@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 May 2022 10:38:06 -0700, Anand Gore <anand.gore@broadcom.com> wrote:
> Add dts for ARMv7 based broadband SoC BCM63178. bcm63178.dtsi is the
> SoC description dts header and bcm963178.dts is a simple dts file for
> Broadcom BCM963178 Reference board that only enable the UART port.
> 
> Signed-off-by: Anand Gore <anand.gore@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
