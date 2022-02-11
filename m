Return-Path: <SRS0=YsOI=S2=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC81C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 22:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4C2DC340ED; Fri, 11 Feb 2022 22:25:16 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A948C340E9;
	Fri, 11 Feb 2022 22:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A948C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id v4so9308958pjh.2;
        Fri, 11 Feb 2022 14:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TyiRNPXzYuufNzc+eJL9yfq+WQejmY0nq5p2JKgES3U=;
        b=LFx9jruK9x49CkTy2FO+U+q03Lchcp/iDi5AZdP84lGfOdxLhPIEdC/FVtaMFo3jKk
         Jg2TI5YQ6vmeOMjMgfRj4liNYXJbdhQ+r1akrYzOCGDMQkfmkghoTWFoHmtSmefCWXFi
         4K1m+qNQLwFNhqAt3LpfISLKL9y4ekGiHyRO2ms+H4w+ClSEWjTjUdRbpWXqOz3mSQLq
         uwa9WuCDiNIrZvVS7F4+6hAsY77w6v98gqDPRn7cwYmPgE5gQauoN0roNa5D8s2NBKBI
         UkiQ+iA/EXBcKAnYd3AHzbIAoDwAqQHSSlIw8iBHbFW9iERHtOj2L4LLypKombiYVhta
         RRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyiRNPXzYuufNzc+eJL9yfq+WQejmY0nq5p2JKgES3U=;
        b=h7td5gY/AReABtXnqoIWTGHQgmLWOOUG/OqY7GtDRXlFt3xZk7AAUDrR8OLlDtJ2O7
         akpWCgTY4psoLVFo6JAbP9QaBM1OcAAV6otDI+1AAo3Y9XnCvJsOhXGFUig3cG81xpcS
         4GV4hm8BOU8TwkNA+mDO7Io0l+OlduNqKNKexVDmb+HeXZDb0oIrKhpPLqAhd/kpp7aD
         BGaF2TrY0xa6+NKQi8gV755dLv2goWs8XB9iW08vdG83ZeIuBha0vKLW1d9w+Q85fBKI
         dw9okZV05GGNNW+CCC8SuLQaUL818624887jdBmeTuUiyJi4HpA9B+GfLMdcorJZ0sbg
         87iw==
X-Gm-Message-State: AOAM533StXm7/JW4fpbHmIX6G9GaOyORFLzWc25f5KeLI9WHYvIbeUv2
	h98OuJYmojtyOHZjgMCu34M=
X-Google-Smtp-Source: ABdhPJx1I7TYhuDCZSSIiQRrjBpcpad2P8E/J+ZRSwaVKzIJa0BhvqVvAEfvl6CZE/mUUbA66R4eYQ==
X-Received: by 2002:a17:903:186:: with SMTP id z6mr3628161plg.47.1644618315655;
        Fri, 11 Feb 2022 14:25:15 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id n13sm6288513pjq.13.2022.02.11.14.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:25:14 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/3] ARM: dts: Add Raspberry Pi Zero 2 W
Date: Fri, 11 Feb 2022 14:25:13 -0800
Message-Id: <20220211222513.1145210-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1643736467-17764-3-git-send-email-stefan.wahren@i2se.com>
References: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com> <1643736467-17764-3-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Feb 2022 18:27:46 +0100, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> The Raspberry Pi Zero 2 W mostly bases on the Raspberry Pi Zero W with
> the following differences:
> * Broadcom BCM2710A1, quad-core 64-bit SoC @ 1 GHz
> * Synaptics BCM43436 (reported as BCM43430B0) IEEE 802.11b/g/n wireless LAN
> 
> Contrary to the Raspberry Pi 3 boards there is no GPIO expander.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
