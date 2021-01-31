Return-Path: <SRS0=Fj/g=HC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16C1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B5064E2A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Jan 2021 22:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B5064E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1QecyIUsGUXV+scM4522myRr4T0X/Z92iGIrIFJMyQ=; b=ihwDlQ2Z5aVQdDFarBMM/Bd1o
	vQUIBn4E24NifPgp33Vd8aeQjfOw4A5MkY9F4E36HeTkHJGdhyqRjfoTkypsWxDdj1Uxgq4255qIt
	eJVMnn3UXI2anG2OAxMZd5gTvu/ncRd0tgMvoEN6wMVgUk738NLAjS4OamJMEwA+mqQW8ILV437UJ
	HkNxtsGc+odqNxqKVvTn8AlmHRUPMKedKJUffRRWy+F3Ccwd9rMdQVoaV+vW7MW05gl7cEj1CGgB0
	eLbXLRlPh2LXsC4YymxIYz1/GeKFVeEzgq4kBQkklwgUnecpQngnyN7BxfkWg9Od10U+Mesf2GcV4
	H1GKgDNnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L35-00010H-VD; Sun, 31 Jan 2021 22:18:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L2q-0000xI-Qa
 for linux-arm-kernel@lists.infradead.org; Sun, 31 Jan 2021 22:18:15 +0000
Received: by mail-pg1-x52f.google.com with SMTP id j2so9064915pgl.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 31 Jan 2021 14:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
 b=ZecceKtP4mnRvzX+G9BULnGuizMGXcN+sPvL6VobA/HTraKoQeGASgzqfqXStWtBAH
 cYX91nYf0cdFpbBvq1m7Lgk9i4jeAI4hX+RVCcPuYaHfmj8FPF5Vk9nkTbh0z5kKqg2e
 kU/ZggUmfqtZi/Z1yoxIZVnrVloMteKYu/yv4mvQOsM2O8if6YSTbI2DlY+KM6TF7qTN
 hqbpXTV9aMg3AefS2CVcm3DNhC81VYhjbjJ0aFPHE0lhaYmCeXWDcK3P1fhswQJpYQkT
 /MUmliunPpw7EM6MozIRlp3L9DmAX92V4CE3YR/p+lhu4kuiqbzp0Am34nJr3ixyYPwd
 zbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
 b=YIlOSFdgE2Xc4NVFiRgyJgHStbOAddc/azTYfQcSAfuGqN/dBrcnIvFwu2ZYg+mHM5
 cP0sQ4afWxIFIVuH5sm+Pq0By1WMEaznnvPutX18aILZE9HobA9TV5fhtyofxxcUkNph
 Rcmfk+Pt5SB9k8pAy/zVhVxIJm7rvsPbzT8La7ujn4j+Y8Myh22yJU20vmhXuO4v6x58
 BqLCcFO3m/1+OjOaF0+btDtDSvdsrThCoHwyN0ZROu4faHFJZRCIAu4FkODUroE+W+qN
 9aNuJhHVLBT87j19iuy58V5NRsEsmDtBuDeUvH4tmIeG9qVw0JMyIijmgF6OUdKnheqL
 ELSg==
X-Gm-Message-State: AOAM531v507qmt5L7Xz7ZNFOlIXjRfJEyeC7AWfpNcMYme3+v5K4u19I
 QkakGGKh9HyXamHagDfd+as=
X-Google-Smtp-Source: ABdhPJzRSNtio/NBrFfep7fHfrzy4BXDBG8KVKXoVIVfQ/lAa8qEDQGCuU3mEcOm7n+chBPdtrDTiA==
X-Received: by 2002:a65:6246:: with SMTP id q6mr1020521pgv.6.1612131490747;
 Sun, 31 Jan 2021 14:18:10 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 14:18:09 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 6/6] Broadcom soc changes for 5.12
Date: Sun, 31 Jan 2021 14:17:20 -0800
Message-ID: <20210131221721.685974-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_171812_957661_375694D3 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210131221720.ywvvsSJ3GX6cHROQbO88Iq9JzhPKQIWqgYy_G3b7R2k@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc

for you to fetch changes up to e066cfd867aabe621be5c1855fc42ff699781ae4:

  Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next (2021-01-25 13:14:49 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Kconfig/machine entry
changes for 5.12, please pull the following:

- Maxime adds a select of the Broadcom STB standard L2 interrupt
  controller driver which is used in the Raspberry Pi 4 HDMI controller to
  support I2C and CEC interrupts

- Florian adds a debug URT entry for the 72116 STB SoC

----------------------------------------------------------------
Florian Fainelli (2):
      ARM: brcmstb: Add debug UART entry for 72116
      Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next

Maxime Ripard (1):
      ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835

 arch/arm/include/debug/brcmstb.S | 30 ++++++++++++++++--------------
 arch/arm/mach-bcm/Kconfig        |  1 +
 arch/arm64/Kconfig.platforms     |  1 +
 3 files changed, 18 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
