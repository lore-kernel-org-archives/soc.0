Return-Path: <SRS0=r9yq=WU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B07C43334
	for <soc@archiver.kernel.org>; Mon, 13 Jun 2022 21:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92206C3411C; Mon, 13 Jun 2022 21:37:55 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDA9BC34114;
	Mon, 13 Jun 2022 21:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDA9BC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 184so6695354pga.12;
        Mon, 13 Jun 2022 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tJuz9yMuGGksOUvKub3tRebZ2Fw5veeK+Cx/3ADZPqs=;
        b=kFvWcygyYfM80BvamEw4h/McUWui9JJOBZZz8kW4dtikLbvtO9TEDqhQI4WDq1QfbU
         IHrWQ8Q+RB8mAXAL8zv5YUwk5laiEREqJykNfoXGwUwCEJ56phppC+u57ecyeiOQDV9C
         28/bZX1V8vFkULKzLpSDZztWUPuM7Svd4sLDb1TopHi1btQCnw4+i7pQ1Mf8rt4VCP6G
         AW7CONpS7jzvTZe/I6VY6VqPUmq06uoyF+THoFpjNmjkd3Ngkpru1qk4pbNEoARFNlDJ
         bj7L23XvbkwxJTShOIkIFV6LTLxToMJx/V9nw19siXQKE0IJC6QwIj25edQ8uJKClcfN
         gYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tJuz9yMuGGksOUvKub3tRebZ2Fw5veeK+Cx/3ADZPqs=;
        b=ZXozW1F0CceUHR+8ogEqC9fDLdKVMVHbDcPq+YKYTuMOZjZbksfB6VQCKU42HPF10i
         0X/sbWaawntVjBuMQ8ea9oPnFPNrW7KPIPjRdJoVbgGC+ckzusovIv7uWsITccHV8isJ
         /qr4UlgpeOsVKB4ps2EZoQqGhUpYe2h8QK3wwuZ1JH06WdAKPx7cCxT5NESGQGH0mhj1
         AHSR8242e0LGn9peUFQQCguOElb+zxhK7s6OgT3SLnSdt5AkenSmiKyQiiLj9yTgcnH3
         zQxdwmX8bfK4Qyc9U4QunSR243mkhfwIbK1IaxfP53oyEy8Zz+g+o2ef4UOMRySfbcI9
         evQQ==
X-Gm-Message-State: AJIora9WUG6t9fqv7kwd1i7lhUe86FvwWDMB0gE19kF2cbvRbE46IOAn
	qi1KuQjJVxiOX1g/+5l5nXo=
X-Google-Smtp-Source: AGRyM1u329hcXoRkwsNq9U84BJFUtAmhlF0l5uLrFTGxePBB02dK+vjoxQwha4ug/5vzUBrmFiqNgw==
X-Received: by 2002:a05:6a00:2809:b0:51b:f239:d24d with SMTP id bl9-20020a056a00280900b0051bf239d24dmr945096pfb.73.1655156274363;
        Mon, 13 Jun 2022 14:37:54 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709028a8300b00168adae4eb2sm5574917plo.262.2022.06.13.14.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 14:37:53 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: dan.beygelman@broadcom.com,
	joel.peshkin@broadcom.com,
	samyon.furman@broadcom.com,
	philippe.reynes@softathome.com,
	tomer.yacoby@broadcom.com,
	kursad.oney@broadcom.com,
	anand.gore@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: Add DTS files for bcmbca SoC BCM63148
Date: Mon, 13 Jun 2022 14:37:52 -0700
Message-Id: <20220613213752.268314-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610002113.14483-3-william.zhang@broadcom.com>
References: <20220610002113.14483-1-william.zhang@broadcom.com> <20220610002113.14483-3-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  9 Jun 2022 17:21:12 -0700, William Zhang <william.zhang@broadcom.com> wrote:
> Add DTS for ARMv7 based broadband SoC BCM63148. bcm63148.dtsi is the SoC
> description DTS header and bcm963148.dts is a simple DTS file for
> Broadcom BCM963148 Reference board that only enable the UART port.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
