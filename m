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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C267361477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C267361477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jK+NnC4u+NjGsmmU7+/3BSzrmQTvb63hU4aY3Ck7wsM=; b=fyBtsysETRvGytWO7vWvDpHZM
	CvsmbA+myqe2yis4MippgoXzRSJ8MsnI5B7ibTo3496Lb1JYhrI7pKc3EVeplg9DJpZO0k0Mno5CT
	sT6+p7RVBkTrHFbOKUQqLhoyy4wqx71UYiGvOP4cwtw5UYwhRMQJ0fXgUe3jFJQojMDC/zRmDQ0sg
	1hiBCASCxXKuJAfJxE+HiAf8Ayz+zPcjxHMBy3BXWxXLu31PeKT1Zcj6jgwNLeVfKXsSCiRrc+UVg
	87zk3fQbB0e5B9ghZ0O3OiL94zmszuvFGl6zw1e5rfwJ5UmbmgluOkseBVqU8CvnnWdqQUG0t9GnX
	m3eE+ngDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5ZW1-00022H-1B; Fri, 29 Jan 2021 19:33:09 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ZVv-00020v-Lg
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 19:33:04 +0000
Received: by mail-qv1-xf33.google.com with SMTP id h21so5004184qvb.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 29 Jan 2021 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mwt6PYt422RZr5pAeACM9vyiMCyLXs8GJeF9XZ1Ku/4=;
 b=XvEoFspRjc44ZPN01jRZgrDB0RcoMQx30OGPldUb0GekBNzzbbWHmmokWKb1QpDcY0
 zT8sD6jjRTNCsPDMtwG13pdDrr+UsKufx70NWQhm4z0PZxMWhsUxu64Pil/833RPbD4w
 moUi/1sJbECYY9mXtGpFubfV4066tSJKNGKRWmTCj3uOr1+p16awkyTBKK7HD/Woz1HT
 vVAK0mNtCgAzuQqSh8EXnkGt/bS0QMEesvVIN56zlBp3xGVLvvoINi8JRieE+x/R5+6Q
 3ctFEHB8o2/qAzYwfHbAKspZnEicA0Zr5ed5yWApu6wZMBPCi3W2sFnfpIx53UbJQIsz
 BqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mwt6PYt422RZr5pAeACM9vyiMCyLXs8GJeF9XZ1Ku/4=;
 b=uZd0zrKU/fs0Ymhm4W3CmstQSq+xTTZvFVFxw6Vb8u41sitF7NfPUrjGccF1j1JTpO
 pQhUEfd+Q2/IaFyWGRgrdfzYpNg4EImwrTkD2q3kqQtkZLgcocZF4KilxKFBOzCXC/xL
 pF62Ragwmk8E/TUov5Wv4VMy+giGnmN2mv70AdLW5exRpVATGAtSl7RieMLCleRL7YHV
 Tmf7za7YzGf7ZLnAADxPPFgAqqZKvgBsGRR0gNRJAeU71h9Q90EWxW69HFiPGAJq5nBw
 lyHpD7C35zu5JBnUvY7ewXpIlVjiUsLnCFbF/dm2gP/FMfbY0jhhDQj8JB5pKc/XxTJ/
 XPaA==
X-Gm-Message-State: AOAM532XT8XDDSJzPYjAr3WoKZYdi/SC4BGpHfVlBS0XT9JIw33cWLQt
 RPrl1UA0bRlFmcdt+Wy6C4o=
X-Google-Smtp-Source: ABdhPJz6//JxPflubp5RhH+Qrff2wJYD+9lPMkoqu3M/SZu9QEK9EVrKezOiEwB1HQiXJU1P+wJCkQ==
X-Received: by 2002:a05:6214:7aa:: with SMTP id
 v10mr5405656qvz.2.1611948781910; 
 Fri, 29 Jan 2021 11:33:01 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id m10sm2615314qtp.72.2021.01.29.11.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:33:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 2/6] dt-bindings: tegra: Changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:50 +0100
Message-ID: <20210129193254.3610492-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_143303_746420_B520ABC3 
X-CRM114-Status: GOOD (  10.93  )
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
Message-ID: <20210129193250.M3z-B0WgM1NSDJIcL10SBqqixEnnEmcXHaOVHYu0S9Q@z>

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-dt-bindings

for you to fetch changes up to 6c50321fd65135a28450f16b5745b72368d61006:

  dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU (2021-01-29 16:56:47 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: tegra: Changes for v5.12-rc1

Exposed a new QSPI clock to DT on Tegra210 and documents the eMMC SKU of
the Jetson Xavier NX board.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      dt-bindings: clock: tegra: Add clock ID TEGRA210_CLK_QSPI_PM

Thierry Reding (1):
      dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU

 Documentation/devicetree/bindings/arm/tegra.yaml | 8 ++++++++
 include/dt-bindings/clock/tegra210-car.h         | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
