Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB2DC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C3261477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C3261477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9E+mtFcC23sPm8t+KjTY3p4+z25oS4xSY/b+CE/+0h8=; b=Mg2RgsmHstgfRohoQmJFtszbU
	z5Gt4LaEMPZ54qZiddVeLQ1SHFBJFFjwilfEhIOAa9qgKmCwQpEpJ2lwNM4LdHWHdOz56CUltJNYJ
	uJUivIzuf8vaeLy3yy5Z7m7gj0aXf7g4rZaytERQnFeHzVdBQsS8PTYGlDlr1NorwEoMwAkK0vxcA
	v4eR8TdJS1vAKPlO6lV6WnBtAhB5WUK0c/D0zaokHtskYbT24owe8rylAJsPVj4MswbizycYOf6G+
	PnYyf0vazGlfAQW/LsrWqEXvWHgTnUysbMqbj3bWI80MrqMxZ3NlFfqEoYtHed9JSu/Js6vd6Tria
	FyrHhuhEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5ZWT-00029h-Gg; Fri, 29 Jan 2021 19:33:38 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ZW8-00024D-KN
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 19:33:18 +0000
Received: by mail-qt1-x831.google.com with SMTP id c12so7537393qtv.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 29 Jan 2021 11:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFHRAjZ8nX69MCGQDYe4XhkLBjs/Z0Ct7NBrTC9cTMk=;
 b=bsNrcZEarZgW0Po0NAJPjZDjwEgxeYhgqV49HLA8UIqo4TrNfcY3FMx4UuoGtW+uTA
 8g/OuUHdkb+r7K7KqShnAyAgQtXLD9bSZmLqwQm4FjS2dVEEb49aZaCQ1eiKtPP6eD4a
 PC8AtCw1nyWgvw7rHE9gouTZuHZbLYVwnTQH2BL1P5SECkSRN+lAZwQ0dpR6GQ2Scr2f
 7+Xbbdnzy4A5D0dagPA64jm+a+rkMYX/Mykl0F6jdfPSZuKFGY1mmyJbagaJBmxGnZkw
 /6QoObUoaWKg7h/G8boaCME75ddAM7swmX1OScKPoDFXvloJP+QcsNx+qpWUP1CRZjs8
 rSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFHRAjZ8nX69MCGQDYe4XhkLBjs/Z0Ct7NBrTC9cTMk=;
 b=Ox4CVjh3EhiVjQZSiWvtD7jXE6nj6WxiZpeO4ytcSllKSyNgcEi2P57mA2q+LBotL3
 ZDd6w3VxJbbb5eDia5aKamT3H2+9NbJ7oD0HbbjFSEBcibskMhsnsToMrDAtm/VABHWM
 aKZVLE8d/Ops7HbJjUDLfDlKb72+KU7w0Ir9BewCdzCxAJSitqKyRKYvp2NoiAygG9FM
 4F2lPi/qt6aNkajxRVEPdcSIP/AiLuoJcnrb5DB1bJYqivLbQwIL4LzgrJwi68wCyQyd
 bQoeGLlJaNSJClS0ZV3N3EFXKoi0qOslVidqIcr8ns0LTxqEybv3kTpdvRqblXA8a4t/
 SOHQ==
X-Gm-Message-State: AOAM530IA7C3y5JNU7deC42buh91/0rQBmkAVOpp/XKOoQeamSvtOIvJ
 PMKZuB/u/jCj+ZpGKZgNKj4=
X-Google-Smtp-Source: ABdhPJyFqwSvYvuleJAmmspJ/vdcbX8JOeFxIZoJZmk92hjCw6EzB1LLylZKkUhkeU94woi0pswpOw==
X-Received: by 2002:ac8:747:: with SMTP id k7mr1352633qth.348.1611948794899;
 Fri, 29 Jan 2021 11:33:14 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p23sm6813175qtu.4.2021.01.29.11.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:33:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for
 v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:54 +0100
Message-ID: <20210129193254.3610492-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_143317_861189_1C86267D 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129193254.IaaPO3MLtxm2Z0TMbXYAAjp2eZK6yI9j8jmRBw1CKcM@z>

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-defconfig

for you to fetch changes up to d93576c66c4b728c69920a2c25387d6e1fd4b902:

  arm64: defconfig: Enable Tegra audio graph card driver (2021-01-21 19:59:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.12-rc1

Enables the Tegra SoC thermal driver that is used on various Tegra132
and Tegra210 platforms, as well as the Tegra audio graph driver that can
be used to enable audio support on Tegra210, Tegra186 and Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: defconfig: Enable Tegra SoC Thermal driver

Sameer Pujar (1):
      arm64: defconfig: Enable Tegra audio graph card driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
