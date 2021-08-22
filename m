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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6275BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C6D6126A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 19:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25C6D6126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdhBJGjYOLX52kyIKKqPvX7TxZbzmw4b9pR0uqSxNxc=; b=2I9vH2YHcpSdy2
	i/dSY6romjkxWh+RxmrdEHdpSuMqsWmBi2XKVwOI4DKV1gYpgvY5U9QPJuSz5inC1nfLclSN3j9jN
	VY9NJ7APjTSPUC8QKO8Y81V9kZSYiG97pdeqD1zs2KPF/iEe8CX4CyJElL61xnaziLE9L07LT27je
	Uua5Rdt2rRF+Qi1niGlPXugcpPT6xt0PKNdsVl4BH5YXmAqiq9E/H17BMHqNVPwShnRV+Xqm8G1NL
	ykNI5/ORfYkC1mxej1A4hmfiT3lYRLqq9eLzHujRAg4aVBRkfIOP+w8iueC9mQX6o3PdRFMqw+sMT
	/nM3aglMcQUNzRdmm6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHsoX-00EYot-0L; Sun, 22 Aug 2021 19:07:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHsoU-00EYoO-2u
 for linux-arm-kernel@lists.infradead.org; Sun, 22 Aug 2021 19:07:23 +0000
Received: by mail-pl1-x630.google.com with SMTP id b9so4501929plx.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 22 Aug 2021 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zxXXhh0DEqjiPk1bf4TGcus3ngVBbA5mFl/MCDhfwBQ=;
 b=MLptEgfw0gVbD2H1/ibOdWn1rw3SMv+6nXCsV+5RBRBP2zY/bq2myNmj+tNlYHZK4n
 Cu2Yk8jFsHhhZFaYzuTf4yuq/Lj3lNiIiDPCRTr/hS/FhsTLtRQPFrfP512rkeqmpIJJ
 WrJ+1l2/43sZei+NGQtCnkLh2sEQe2tGdfOILUy3A1/f0tZBv6go1Fmbx/l38VyuIFoy
 ygYfJaVI68vmPzPfG1GxNw+88nmTIiIBU+dakSy6PqipHMi+cgEsswbuPl2CklJV6w4M
 COcG9RN6jlI4I0iw5FXFu4Wcg7oBKKF4S8nRyRjvkUQ0NY+DxJf/eJsRqjqALD+Ry1Di
 6nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zxXXhh0DEqjiPk1bf4TGcus3ngVBbA5mFl/MCDhfwBQ=;
 b=RyZ8OoAivwAkDQbtNmSg6d9bKjJSzFKoSSl9x46K/XhU336Y5xz5sCHVKw54gzUlXH
 Ie0+7YGOTFD86vIxdyxQHrtI1jP3hhWFf2gaYXm1ULEliERRzqkoC0DpTCPTJMlwBlz7
 pWp6QL+TrrRNGymrHa3kQTteVfVYXX9LPXthMFWgMu5nZOB0hlJXLFt7sZ0kbrWPu/fp
 /JBwFdfNoNWSqPpioW1v3PSCH3FGPIEBAxly2hSW0EX99OgLryzzG7YnD54XLxarL1qM
 MKyGoGenxB3RGJmYfs57O+GI5O6E/dZfma5vZIG4eSN7R88loLrLszr1m3g7rVZtTIXC
 EJsg==
X-Gm-Message-State: AOAM533YOW+HEDP3HFiBeTANlFrPQ2nTMkom45ZiD1O9OaAEwd2zEeK4
 c/IuUD5I4hno7MYv8HSuLGk=
X-Google-Smtp-Source: ABdhPJwVjTddJ7AzPTybQWZeiR2U0S6mCXyGLOYG0JqbA7fWLv9Nco4FHAB1gSqfjAeO0hPkCXE2Rw==
X-Received: by 2002:a17:902:ce8e:b0:12d:ab00:2518 with SMTP id
 f14-20020a170902ce8e00b0012dab002518mr25396743plg.58.1629659241414; 
 Sun, 22 Aug 2021 12:07:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b20sm12962871pfl.9.2021.08.22.12.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 12:07:20 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com, Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] ARM: dts: NSP: Add Ax stepping modifications
Date: Sun, 22 Aug 2021 12:07:11 -0700
Message-ID: <20210822190711.3714024-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806204446.2981299-3-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
 <20210806204446.2981299-3-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_120722_173633_E38248E3 
X-CRM114-Status: GOOD (  10.47  )
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
Message-ID: <20210822190711.cJnZ4XoKJsnc9FibMU5flCy_ruPZUxUJGYd5yvENHN4@z>

On Fri,  6 Aug 2021 21:44:33 +0100, Matthew Hagan <mnhagan88@gmail.com> wrote:
> While uncommon, some Ax NSP SoCs exist in the wild. This stepping
> requires a modified secondary CPU boot-reg and removal of DMA coherency
> properties. Without these modifications, the secondary CPU will be
> inactive and many peripherals will exhibit undefined behaviour.
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
