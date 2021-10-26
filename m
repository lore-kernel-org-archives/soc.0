Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D124C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 14:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0638E60F46
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 14:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0638E60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k9Zp5XAQb7c5UgRHchLgnTocSqBiLSmLbEHi+G8nU7k=; b=XEl0uj0xy1Fz/H
	0oo6DSUD6raxDsKJrKA6fBW/g5KHJza/xbhb/VQlcYjndXBS+WcHMQtdZFs754SjYfPC1YDblmGRN
	1OuzpnH3udmukSM52STuwz8Xh0sJBr/nQFScAonliVvho7iUgQpU0PG4lh45YZ0UjcMhu3FLM94PF
	ON0ViWF2DcEfldQZsA+eY23Uei3HFZMG3D6YW5wqT9RBm9tKuebGUMTZoPEE3Q/IQFDFKNC6RoHUh
	IKCwba1hP3ad2hL7aGiIzy24ZwtZ9lqPslbLJmwYokq2OXLh4RFrXvQe+nM0HKqT/rGX3hNbFAJTA
	w0FqWcoev4bSfDZXgVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfN6f-001yzC-Gk; Tue, 26 Oct 2021 14:07:13 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfN6b-001yyc-ME
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 14:07:11 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 b4-20020a9d7544000000b00552ab826e3aso19970587otl.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5Qlx1y7ALla3mofzLviDldMhP9x8JiihdYD246zlCY=;
 b=JmNzDIh4MWt3N9J8HsHlhZS+nlhV7KoxC7nizgJuk8hQsmjIouKI6bZ5bpUnuqfv9F
 eYV+4iGHhN5KXAdPqk14uGbuD89z20WMaKbJ3yHzvhJ5b+1OEVg34W+Fze33WKrTBCNg
 ksxMj0PjQNXIkkeWcxguTLeeSKKuYwATCYfMlf+RklW+iae+QVlRAvbAkzB0cnE/D8qn
 1Xa5yEy4VEvsh5vlETy2qNsjMsqnFzPDdIh33FdFP7oSUpmcsfIEI8g6WvNneS0+x86E
 wd7FgHSN0dvPvMXYrXFZsTLwdU/lCpty2XRCuhk+tybAdZ0rGPumQ/58kbLyufSdZ0e6
 GMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5Qlx1y7ALla3mofzLviDldMhP9x8JiihdYD246zlCY=;
 b=hNAQItK5ajic69kJfqzHOaNUspJSmJaVXcFpAeIsVhk3S04a99BVixmskB9573aWZQ
 t67h3Oj3NNObgqQ/XtRX2Yt30f9nJADaSV2ZIOLhFJUfAmNa61Qlhv4hTOQ5bh9FyO40
 MkKGgAppr5yARnsslyF1gNmIHbqxNxyZh+bnslmNtB2y1jf7+bmqHzWukkqXkOdQEYDq
 UGiXD4s4xa1HqLas73N7f3qVVctBl3FIPGzhZr1ffkB7+NGllB2YwytZfFdRczkzNb+0
 E+UV5Uu3zUVTmukPLMMaFUgGixVhLiT4gICrazuBTRf2hHNiBPTHFdHuX3um+ChXX+Dq
 s/Ig==
X-Gm-Message-State: AOAM533JYQlLdvCjM3yUhQBaXPNGmHQjaOcmC+tM08MJynnfbiZpZ+3e
 gvbdyaWWnVSyRd2qAaxHWAJN0Q==
X-Google-Smtp-Source: ABdhPJySoYtqBF6E1gZIxLymCcbN+YVTvANHlMP5w77ok+wlM6XMABiz0bKovqVOltEZwyU2aKVweQ==
X-Received: by 2002:a05:6830:60f:: with SMTP id
 w15mr1773894oti.150.1635257228425; 
 Tue, 26 Oct 2021 07:07:08 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id f8sm4473429otp.63.2021.10.26.07.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:07:07 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mahesh Sivasubramanian <msivasub@codeaurora.org>,
 Wan Jiabing <wanjiabing@vivo.com>, Chris Lew <clew@codeaurora.org>,
 Guru Das Srinagesh <quic_gurus@quicinc.com>,
 Lina Iyer <lina.iyer@linaro.org>, Maulik Shah <mkshah@codeaurora.org>
Subject: [GIT PULL] More Qualcomm driver updates for v5.16
Date: Tue, 26 Oct 2021 09:07:06 -0500
Message-ID: <20211026140706.1205989-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_070709_756124_401F4B7A 
X-CRM114-Status: GOOD (  15.33  )
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
Message-ID: <20211026140706.iHjQ-aKOgclLDGpbnIIqE5PMoVjhYD0k7v8Qxxb7mbU@z>

The following changes since commit f27591125a56c8c50491919b159569ab5730878d:

  Merge tag '20210927135559.738-6-srinivas.kandagatla@linaro.org' into drivers-for-5.16 (2021-09-27 22:13:45 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.16-2

for you to fetch changes up to c50031f03dfe1c1462f326973ddc5f0db839fb68:

  firmware: qcom: scm: Don't break compile test on non-ARM platforms (2021-10-25 14:21:34 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v5.16

This introduces the Qualcomm "sleep stats" driver, which aids the
efforts of bringing various Qualcomm platforms into low power mode.

The SMP2P driver gains support for negotiating the "SSR" feature, which
is used to better synchronize some corner cases that might appear as the
remoteproc is recovering from a crash.

The socinfo driver learns about a few new PMICs.

SMEM is updated so that it's possible to put the compatible property
directly in the reserved-memory node, to avoid having to have a separate
node just pointing to the memory-region.

Lastly it fixes some bugs in smp2p, apr, rpmhpd drivers, notably
avoiding the issue where powering on a power-domain using rpmhpd while
keeping the performance_state at 0 is a nop

----------------------------------------------------------------
Bjorn Andersson (6):
      dt-bindings: sram: Document qcom,rpm-msg-ram
      dt-bindings: soc: smem: Make indirection optional
      soc: qcom: smem: Support reserved-memory description
      soc: qcom: rpmhpd: Make power_on actually enable the domain
      soc: qcom: socinfo: Add PM8150C and SMB2351 models
      firmware: qcom: scm: Don't break compile test on non-ARM platforms

Chris Lew (1):
      soc: qcom: smp2p: add feature negotiation and ssr ack feature support

Dmitry Baryshkov (2):
      soc: qcom: socinfo: add two missing PMIC IDs
      soc: qcom: rpmhpd: fix sm8350_mxc's peer domain

Guru Das Srinagesh (1):
      firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()

Lina Iyer (1):
      soc: qcom: spm: Add 8916 SPM register data

Mahesh Sivasubramanian (2):
      dt-bindings: Introduce QCOM Sleep stats bindings
      soc: qcom: Add Sleep stats driver

Maulik Shah (1):
      soc: qcom: qcom_stats: Fix client votes offset

Stephan Gerhold (4):
      dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
      firmware: qcom: scm: Add support for MC boot address API
      ARM: qcom: Add qcom,msm8916-smp enable-method identical to MSM8226
      dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method

Wan Jiabing (2):
      soc: qcom: apr: Add of_node_put() before return
      soc: qcom: smp2p: Add of_node_put() before goto

 Documentation/devicetree/bindings/arm/cpus.yaml    |   5 +-
 .../devicetree/bindings/soc/qcom/qcom,smem.yaml    |  34 ++-
 .../devicetree/bindings/soc/qcom/qcom,spm.yaml     |   1 +
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |  47 ++++
 Documentation/devicetree/bindings/sram/sram.yaml   |   5 +-
 arch/arm/mach-qcom/platsmp.c                       |   1 +
 drivers/firmware/qcom_scm.c                        |  96 +++++--
 drivers/firmware/qcom_scm.h                        |   4 +
 drivers/of/platform.c                              |   1 +
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             |   2 +
 drivers/soc/qcom/qcom_stats.c                      | 277 +++++++++++++++++++++
 drivers/soc/qcom/rpmhpd.c                          |  20 +-
 drivers/soc/qcom/smem.c                            |  57 +++--
 drivers/soc/qcom/smp2p.c                           | 134 +++++++---
 drivers/soc/qcom/socinfo.c                         |   6 +-
 drivers/soc/qcom/spm.c                             |  21 ++
 18 files changed, 645 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
 create mode 100644 drivers/soc/qcom/qcom_stats.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
