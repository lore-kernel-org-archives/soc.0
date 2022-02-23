Return-Path: <SRS0=z5GF=TG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE39C433EF
	for <soc@archiver.kernel.org>; Wed, 23 Feb 2022 19:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5BD6C340EC; Wed, 23 Feb 2022 19:03:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3DBDC340E7;
	Wed, 23 Feb 2022 19:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3DBDC340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id z16so16278256pfh.3;
        Wed, 23 Feb 2022 11:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M+ikUS2HXQGSZdemxaJfX0vveKZ/5VeOycL6B465U6E=;
        b=GG7/aPu3rWPLCrcqfX/MtdHF1OgXJCOXAwRiVoJcrxEu1fdnzxPDQI3T5It2uKeMfu
         Xq3t8JExNtHKemFUykYPQ5cRZ/qpX0dT02vKxwZCDebDvAxG54+6sQRqBAZs6xHTB7xT
         zyjbK//LuqfHL11h2ogaay2bS/XLvwLC9Q/eWNnQ5w4MmGVY1qIfXVAizMoBXK+/Ktkb
         3bKtqXNBei0Z1Orn0y7x5sXMHb0DGkUKeD4/oc8VHs+VubXCutNOrdW1O9xphbBdGSvV
         pC8e/dtqH9R8VDCOB5fUt4DWsNbIyVKppYJwuJLS8Bb8UOCcbJUBd91FR92YiYZfGsj4
         XK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+ikUS2HXQGSZdemxaJfX0vveKZ/5VeOycL6B465U6E=;
        b=ALuqgX0uBx5WlmU3sZIa+XcsOFnNAvydLd7Mhw8fMWKXaRV/VTeJMWKyGxdILu3pkL
         Z9PNSdgn+npixRo3dM0g2ZdBi/JhKjVGK8IxVhHQGBnHVLoWIB2TCRMX9wMweOFSg8op
         Inlen0kvoajEX58pgk7CbuSOlWYmCiBVotaglfySQBGDgWSIPkBE/6I4ZVM5ZdpnL7dF
         7ekjW3rJTKxEGY961QRzmG58d+rxU8DnbEU4VnnmlwIn+UvCCgj8wCoEytMy1Wf48qQJ
         XcUUcmqRWBkT5bcHQ9NwXc6LCcm3+ltoqr2mNCcLGyWbsPNSNG1yRZA6vqNa4qdn3vOi
         JAjg==
X-Gm-Message-State: AOAM531ee9KjUzvq1b6Ch5PBJbJEOInl15x2YfcdozcZ46pYgpmgEmf+
	FR6ccdcrEPzL2MD5Za/DKIbNRWZ6J4g=
X-Google-Smtp-Source: ABdhPJzIOAHE404bN7qZ0z4kLUHr0Uo2twhFBe+78QJPo4jSfLDYpDIPmIQ+q7rYcfgyKoomzbUDyQ==
X-Received: by 2002:a63:e744:0:b0:370:25a8:bfed with SMTP id j4-20020a63e744000000b0037025a8bfedmr812276pgk.432.1645643015401;
        Wed, 23 Feb 2022 11:03:35 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p2sm215516pjo.38.2022.02.23.11.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:03:34 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] ARM: boot: dts: bcm2711: Fix HVS register range
Date: Wed, 23 Feb 2022 11:03:32 -0800
Message-Id: <20220223190332.3791516-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1645272475-4096-1-git-send-email-stefan.wahren@i2se.com>
References: <1645272475-4096-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Feb 2022 13:07:55 +0100, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> From: Maxime Ripard <maxime@cerno.tech>
> 
> While the HVS has the same context memory size in the BCM2711 than in
> the previous SoCs, the range allocated to the registers doubled and it
> now takes 16k + 16k, compared to 8k + 16k before.
> 
> The KMS driver will use the whole context RAM though, eventually
> resulting in a pointer dereference error when we access the higher half
> of the context memory since it hasn't been mapped.
> 
> Fixes: 4564363351e2 ("ARM: dts: bcm2711: Enable the display pipeline")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian
