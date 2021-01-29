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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57595C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219BB61477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 19:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 219BB61477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ev3KIXmoJZt15/TvK5bqHe/WatWOHYxFlK89kg0k0X8=; b=H9iKHhVzhjSUShyV/2WKQcpOt
	bwQa19RcsF4pibjIwQO0JuUz1IS4SL9r/2DwCh0DZPXyyL2wVrhM5JQAQ5rnSLHoj+qhwi/maBOGj
	Ez9uUZXO5v0ez9Ania1J7pEpXVk+8q7fVSUH3oX7HvScb7xeuoX5jI3Y2oPdQ8t1xoAR9gPIJetqc
	eGrBQRdr1NCZP9QKQhG5UJLmx31BzaiLtvsCtJ9txklqfAk6F6nFugRVg49IgcroAdLlqwMtDahom
	T6ZY7vZXP6fwOE9xUANIjDItjtL2wsASR347mzu+MmECfA59MXVN4JknpcdhfgEx5miOoVpWgEesu
	d0RkJQR6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5ZW3-00022Y-1U; Fri, 29 Jan 2021 19:33:11 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ZVz-00021l-5r
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 19:33:08 +0000
Received: by mail-qk1-x730.google.com with SMTP id k193so9860869qke.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 29 Jan 2021 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UF1FuT9xzOslp9BVbzccUgOHaBgiNbyOucfQV9Cc5yo=;
 b=p7Bxm9vXWp1Jsk7ePN8o05nMake6NtcSCHPOUp4IBM8uA6cRJMVtj/PQ2f8JT+w2yN
 S1zS0LbAiVE6LteP/hEaHXYE5QWLHzkZ66rOrOAc49BNUQ4UwtFqZbQjjI9a5fA7euvE
 tHj7f4UXx2/DEJzqcFdArsL+9FIk5PgrF4A/Goxznvjd4vvmeMprDgaruLqthn+2aSLY
 oeMnOzsTHqfZq7gi04uI+ugWd7+KqwJc9tLjf6d55wrqrRioHVz3JHcOGzGAcNZ7x8fD
 Ab6Ol8yUSisOuF7llSasEenm2TwZ52VvyEo4nhXrfOKubM84dLxMPOhMx6MPmXb/Qjif
 C4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UF1FuT9xzOslp9BVbzccUgOHaBgiNbyOucfQV9Cc5yo=;
 b=jTBjwt5grTYRwcEzg6PFnEefE07Dq12j2eDyZIRj5WOF+tqc+blZ4ORsubkdp66XYc
 yaZcwuikMByCd/g0qGd77i4sDmzvYONtXQsyqzbuZaUSg/J5FfEEuvbe0RBkiQtVfExI
 gFI/5HUZviV+n5A0Dgigefg9pdU/bNxhgAqX+HLrodDPxxZYzRlnpt2PE19AjaH6520/
 L161kuFJZxaNhK1Ps7jtg4KA5FIm93p7r8UR0pbdQwkP5ABPfXkJRvyjk8lc/JSmcsyo
 jIKNfYPoFKqfQW2sJLH92JlU9N6jk6vZ2p5HGdI3yqO1dzBemzwz2BrkcOnm2uY+ZWFe
 k5jQ==
X-Gm-Message-State: AOAM530aUx4jSFT+/1kJysQxe/WtabO4AigogSe+qidbbhb61nTvLoyU
 uWe1gW2cgKPEKfFVEnL01KQ=
X-Google-Smtp-Source: ABdhPJzjSr3CRtJQQqcROceNY8YzqlkRQ25Fs6knj39dqXcwFByXRuKueo1b3ldP5TkneR94nG3FAw==
X-Received: by 2002:a37:67d6:: with SMTP id b205mr5464511qkc.69.1611948785521; 
 Fri, 29 Jan 2021 11:33:05 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id h25sm6766606qkh.133.2021.01.29.11.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:33:04 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 3/6] ARM: tegra: Device tree changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:51 +0100
Message-ID: <20210129193254.3610492-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_143307_311350_B647D719 
X-CRM114-Status: GOOD (  11.74  )
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
Message-ID: <20210129193251.VtlC5ZB32TQxW0UYpCwYf1xd83Vu_dfT3aOyuKPX9Qw@z>

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-dt

for you to fetch changes up to 3029a563ac0ccd39b9dc53eadfb9c0e3fb57a449:

  ARM: tegra: ouya: Fix eMMC on specific bootloaders (2021-01-29 17:08:03 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.12-rc1

Fixes the pinmux configuration for the eMMC on the Ouya to fix issues
with certain bootloaders.

----------------------------------------------------------------
Peter Geis (1):
      ARM: tegra: ouya: Fix eMMC on specific bootloaders

 arch/arm/boot/dts/tegra30-ouya.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
