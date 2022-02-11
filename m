Return-Path: <SRS0=YsOI=S2=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02F2C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 22:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7F5CC340F0; Fri, 11 Feb 2022 22:25:28 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57A60C340E9;
	Fri, 11 Feb 2022 22:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57A60C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id u16so12930803pfg.3;
        Fri, 11 Feb 2022 14:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1d+w4SSqS8Y2tOHARM/ajphQrcoSLUxKeD6AXDHhS/0=;
        b=YsCS8FDt52cOk5ekqGIBfuEfqZPNtw7TI7w8dio7U2tV3o70vw/jXDwCeUAkODLYMg
         thG5clo3vOPdI0Adv9CnodVEd6x0GM+MIPvyg8Mfq3bCOg2SANkz3R0oNwkuLx1qKLvp
         gSeuLjO7LOPk4sQqdkLIuabmGXw6CBpDPHaqPFMDDOkzYUk/mokqAFen4AIWK6LPMmuM
         9XWTF7SKVRolhq39VJX+IcjbvfEFZEarW8nQimZk+9aV6irw2WONIhKy9gbiXtKqh0bE
         eD9BBrwaBDx5kLZ4X+wiZCFXu1ThWyXi8dwk5J6ydHVTX8WYPAWriivbkNHMaZv3mMPk
         O+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1d+w4SSqS8Y2tOHARM/ajphQrcoSLUxKeD6AXDHhS/0=;
        b=rjLnuu1JK3zmEOwoo8YXB/cwgNoOMtHXRVPCvQetrQ9tFdSaO+2ZRekL8cejXni8bp
         aaXhOzeLM9JS3LaYCcAAWVJJvSPq0Qk1TEmshi4oivCd2enTpqOwDZt0EwNqQQ0Pa1ES
         Ch5kOiLoRB0QbxhO1s5Wf9oxrftJhfo+DRLKHR6KBv28gPH1vd+ydSlDK092b1E2SRu4
         jWPd4xM0dqQnBWi/tbrfk6drArCXLdYWgjAUoigV1jQRdei6qGsx3Wz6O2H2GVdYYYvt
         VYOVFsToVx4tRI0ewzARwGhrznBkcym4l4ZAXP99s/8d9PFWf/FHigyNrWOXFp+52fUW
         tY0w==
X-Gm-Message-State: AOAM531eiYo4oxXXLIWpQU5f7DyXEIbFDnFSX36uZfzARbWxn/HoUIoH
	e7znexvtDh32YYMmzy/u0FU=
X-Google-Smtp-Source: ABdhPJwPmCYa33zfHeZb+o5jytoQKfT+eQDK2CrUyESxvccaxoutkNfDdcvsoE3aEXK+7Xq9ovXrgA==
X-Received: by 2002:a63:88c3:: with SMTP id l186mr3056432pgd.326.1644618327900;
        Fri, 11 Feb 2022 14:25:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d15sm27521444pfu.127.2022.02.11.14.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:25:27 -0800 (PST)
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
Subject: Re: [PATCH V2 3/3] arm64: dts: broadcom: Add reference to RPi Zero 2 W
Date: Fri, 11 Feb 2022 14:25:25 -0800
Message-Id: <20220211222525.1145344-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1643736467-17764-4-git-send-email-stefan.wahren@i2se.com>
References: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com> <1643736467-17764-4-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Feb 2022 18:27:47 +0100, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> This adds a reference to the dts of the Raspberry Pi Zero 2 W,
> so we don't need to maintain the content in arm64.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
