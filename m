Return-Path: <SRS0=hiSs=NN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1045CC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:09:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D263461250
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D263461250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMCaxJ7wmM48mm9TnpHTLuFahLFimXhthNQfHcAFrN4=; b=OcES1YxvFvOfp2
	v0RV90fT5oCjuaEHL5uTDJ2+DLBUFETNZ4CC9C58Zeq4P8BMLk+yM8OGTN3lZnzZLb4xpFJjABQlv
	1YYy7xG8zPhKEihhiQCu3gFPW1NB+MwljQ60XkPYa7fIK8HQ5cQyEVk/rU8SZlgXxVClWP2/E5hkA
	iHJ8r8nacx5f5lT3pSDicOAJmHubNY2fUqV8CzPKYLTOXe12sRWDJDNe1gIuQ8S0XURZHZnZZQONC
	+a+45HuEceKdY1OHcIeTs5gnwHRAv0wHDlvwoXxfjcjgpqjAnBE9jQBOLRpuN14hSiKUUNnPRfrVF
	Hcp5pn7GJq036VSOawxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHsoC-00EYlo-Bb; Sun, 22 Aug 2021 19:07:04 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHso8-00EYlP-Nl
 for linux-arm-kernel@lists.infradead.org; Sun, 22 Aug 2021 19:07:02 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t1so14553227pgv.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 22 Aug 2021 12:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QChRC5bsvV5GsGHtGsawsuaXm1RQ/2QbEQSA8oSl42s=;
 b=X7x1jGQ6jvPK5Ng6oNKbipRs+whc4v/ZBhTbx/hriXIHDKB+xOQ4xbLPAgFiFFp4q+
 5C6MUCmF/Ncg2S5j3TqDLO5Fa932Tx7097vE5q7QVAY8F4JHbFpItZzFFrsLdngit0gi
 oUIM/ZnA2J+AQhY85BjOofHjqLq4i9wJnvJxduNGNE+G7LNIZGiUywrT14V0cF9Juk6x
 keXb1B3FOnx1H3VAU0aq5EccZAkkebLqC+1uEZlDWTiy3w7bOxAH+heZrnzGQyWH2p3g
 2ZQzZpuYzVSRZzE0D2HExmpMvR9PxpFmuJErLapOShFXakB9Yh3L17wNIn1RGlRQR2vO
 w4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QChRC5bsvV5GsGHtGsawsuaXm1RQ/2QbEQSA8oSl42s=;
 b=YlwXQCKwsxVGRProAQ+0Acwz+5TCCdfYdeXjVd6IeJPJMFTBzGA2GvLinzBTQrF4DO
 m0g4wQernCBf87X/K6c41lCcybu3pM8Z2qqWeXZIX8/cjYMxKJUTDHFRgHlk2hXFXbaz
 qcqVQ/kiODGN0TD0iUTgT2nkm93N9XFwxuLeFmROU5Zv4i0fz4pINSOdxEdCtyZxno+y
 83RtYG7EWdU58RBVWfbvbBS7oS1OaUOgOXTc/slbzd/vNSUZT+hFVTBWzMbYxsg158dc
 WDMURbg9u/vA10Xf+JfBeQVKRzKwm25PyJP6KrDh3nLjNvx3QxmCwfh0+3U3CFxOBqkY
 HpXw==
X-Gm-Message-State: AOAM533SGyVFhZtAauEA3szq6I5xlYXVWCAW/HtDqvMOf4g52O64szyQ
 HE1FWHYpriALQjf6NkZfC7E0U6FmuTHtjg==
X-Google-Smtp-Source: ABdhPJyYv9kHBYTe3Pqh1Lt1N0bT8OWr/15WQznm6TVO/nUMDch7ktyIiIRuPMQHNk4Ghq7FqLWqEQ==
X-Received: by 2002:aa7:888b:0:b0:3e1:6855:a01f with SMTP id
 z11-20020aa7888b000000b003e16855a01fmr30210507pfe.75.1629659219785; 
 Sun, 22 Aug 2021 12:06:59 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id l8sm16915842pjy.42.2021.08.22.12.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:06:59 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com, Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] ARM: dts: NSP: Add common bindings for MX64/MX65
Date: Sun, 22 Aug 2021 12:06:49 -0700
Message-ID: <20210822190649.3713909-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-2-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
 <20210806204446.2981299-2-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_120700_831261_445B9342 
X-CRM114-Status: GOOD (  10.27  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210822190649.HmTeb43n7OCXYh5UV6JT0bVlwlMp2VMsXjgm1UTxtgI@z>

On Fri,  6 Aug 2021 21:44:32 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> These bindings are required for all Meraki MX64/MX65 devices. These
> common bindings include memory (2GB), PWM LEDs, AMAC, I2C (AT24), NAND
> partitions, EHCI, OHCI and pinctrl.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/master, thanks!
--
Florian

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
