Return-Path: <SRS0=YsOI=S2=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48C6C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 22:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AB9BC340ED; Fri, 11 Feb 2022 22:25:04 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1090BC340E9;
	Fri, 11 Feb 2022 22:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1090BC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id l19so12823514pfu.2;
        Fri, 11 Feb 2022 14:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hlel0CrRSfo+Ss7Fkg8X2DsGLJT8iM8dCfSRjVg61zY=;
        b=NAmldIuKyQMc5JxAGsBU2Pv4So2S2ZJTQJhMf39Xts7AtrmQROva72i5L3oCUc3XS1
         juh4qoFewMFH90AsKO5jGnQ3FCM/pelZizrT9j2UHVbd3Z5PeCZc0/SkskLQxgQF5CIe
         7FjWoH6T79OYZ/sCAU+ZCTZTnQbl1bWTD9N0J+GgFFP/LG5vqdVG/aCMnklAsYSViQMv
         NnHUsFIZ6zt4dNRqTRgpB5j+G9LrhLy1gdb2v6KJ/0PoUgNop7LCv0Bq8wLf3m9S0HQk
         Yp29+kHOTpfGlw5YYL+C9mpX4BkoEuIWOaJswNY5lPF1SA9vFOEbDQUt2pzyBawCIZrh
         HEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hlel0CrRSfo+Ss7Fkg8X2DsGLJT8iM8dCfSRjVg61zY=;
        b=wsUycYKua7cMc97ddNbu+J6VqIlIYAAotPX506oVmvmp4pt8N56RknFl06v1WpC4aq
         a6V7864WaVGms1VOhG9ha40tjk+RaAQIK6Xc51EB14OMR3JAxi0noaiTF6frLg+Bl3Yn
         nDGHolh/ui4X5lG78jELUyO2j+n1AdroZJAFtc5FeDemfbNDYXsTc4H6vkpYFVVgg51K
         vU9T4bb8cf4GeiwhqFy3wbl/jyFUTIxYgKEsR1t61hXYbbhzhm3FCqxRBy2ZMtlwg89Q
         5meC6SdVfRSiiUROh7TuZGiPdpOVCkQVX/4I6BzcH4SPT//siagZ7SCq18znacWsotxS
         4CuQ==
X-Gm-Message-State: AOAM531JZJ5aEidwwRKo0MSV1VdCU1fb5r5Q3Hewgy3NAQ5lzxZywel7
	ZfDHAZMdqlz/k6lf0J3MTkQ=
X-Google-Smtp-Source: ABdhPJw2XStzmhFaLQ7RJL3oht/8Ww2emz+1dgPsnvX9milm/H9rVZ8G08TE/J08RJ4tn5ezMfmB4w==
X-Received: by 2002:a65:48cc:: with SMTP id o12mr3127243pgs.220.1644618303580;
        Fri, 11 Feb 2022 14:25:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id pi9sm6890885pjb.46.2022.02.11.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:25:02 -0800 (PST)
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
Subject: Re: [PATCH V2 1/3] dt-bindings: arm: bcm2835: Add Raspberry Pi Zero 2 W
Date: Fri, 11 Feb 2022 14:25:01 -0800
Message-Id: <20220211222501.1145093-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1643736467-17764-2-git-send-email-stefan.wahren@i2se.com>
References: <1643736467-17764-1-git-send-email-stefan.wahren@i2se.com> <1643736467-17764-2-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Feb 2022 18:27:45 +0100, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> Add the Raspberry Pi Zero 2 W to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
