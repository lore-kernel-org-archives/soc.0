Return-Path: <SRS0=XW8w=FE=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEF3C63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 19:01:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EF3E20855; Mon, 30 Nov 2020 19:01:45 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C04912073C
	for <soc@kernel.org>; Mon, 30 Nov 2020 19:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VxBgtU2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C04912073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f43.google.com with SMTP id n12so12392640otk.0
        for <soc@kernel.org>; Mon, 30 Nov 2020 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u81Ska0R+CUYdnKTy+CfOIKLjODnyWA0F8zFjGBm5oI=;
        b=VxBgtU2jEy5eAB+4/oCVI7S2GlqdZ9S4zFbzph8TyNUMuB9E+9c21h3EV4aaVUGCrz
         KVLea1EzFvq8n8SrUvgBXUzH0bPrEoMVTWm5i7b9JgolXv6BgzHvYimP8dccfA1K33R8
         z9py9+9KUeDV9p56ft0kP6qsmipRn/YOztonj6/PTOEfh8JiMvIGw32r1LEBt3jk/OI0
         be5GdU8ZjXd1exSuukbmLYwSUqgjEQaGlpfoMjNvnq+SELrpr9JdfVwYJ0X3kZDzJFWX
         zh+au+bWHV/X9CVymPltv1Gu+Bj9sX0zhszS0VXusPSpZt4Yqcd3CbV2ZgvFvwkscvJ9
         cVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u81Ska0R+CUYdnKTy+CfOIKLjODnyWA0F8zFjGBm5oI=;
        b=q8S+Zk6x9P6U0xC241JSbV/wnNo1RxiQlkL0nLgeo7nhKrwMo7XTxJjLWSEhQFuAO0
         10RW5nQd0ZbS4YC8H03hPfXwE2A8K9WmAUiH83sqpphvFnMpTHelitNot8wmu/oeEVY8
         AoC/BGVtbHWpRtc1c6ss4snmpteJAW8WHt12D5jFzaF0zVQgajj58UtVTdsmiobbPhVV
         24Egzc/4ExD6wBE2SslTEGrfSbuxmN77DV5NXc3xQ/3OTVc/xFJvEDjLjJ7Rs7sj0DSu
         3AHldjpEiMgVJHKkq0dSr6NML2cxgELVifeNrCFPdc+V42CgbGX1kAV5ask3oHgyju/V
         STSQ==
X-Gm-Message-State: AOAM533aXFP405gf595+RdEE3uP0w/xOiaD/NdCzqplD3s8Nj0VpM5dE
	lzjk862itMwrn7jPrra0kdkStQ==
X-Google-Smtp-Source: ABdhPJxsd97RZ49muWOa9Fs75h7isj49j6gp/9d/SczbZf99DIP0w/Pl38H7q49Mkb6njY4qFIbRRQ==
X-Received: by 2002:a9d:2967:: with SMTP id d94mr17306137otb.11.1606762903671;
        Mon, 30 Nov 2020 11:01:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r4sm9241452otg.46.2020.11.30.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:01:43 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Lee Jones <lee.jones@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Jun Nie <jun.nie@linaro.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Lina Iyer <ilina@codeaurora.org>,
	Maulik Shah <mkshah@codeaurora.org>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Souradeep Chowdhury <schowdhu@codeaurora.org>,
	Vinod Koul <vkoul@kernel.org>,
	Evan Green <evgreen@chromium.org>,
	"Isaac J . Manjarres" <isaacm@codeaurora.org>,
	John Stultz <john.stultz@linaro.org>,
	Roja Rani Yarubandi <rojay@codeaurora.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Tom Rix <trix@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Vladimir Lypak <junak.pub@gmail.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.11
Date: Mon, 30 Nov 2020 13:01:42 -0600
Message-Id: <20201130190142.345246-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 80e8eaab5e98fc013fd4afb4aab1fceeb049cbfd:

  soc: qcom: geni: Optimize/comment select fifo/dma mode (2020-10-26 10:29:19 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.11

for you to fetch changes up to 9c45662675b38e80fff48397506cf9fd9936b6f3:

  soc: qcom: rpmhpd: Add SDX55 power domains (2020-11-26 11:50:31 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v5.11

This adds support for the core power domains on MSM8916, MSM8939, SDM660
and SDX55. It adds SM8150 support to the last-level cache controller
driver and it makes it possible to build the Command DB and RPMh drivers
as modules.

It also contains a slew of smaller cleanups, style and bug fixes
throughout the various drivers.

----------------------------------------------------------------
Bjorn Andersson (1):
      Merge tag '20201013212531.428538-1-dianders@chromium.org' into drivers-for-5.11

Evan Green (1):
      soc: qcom: smp2p: Safely acquire spinlock without IRQs

Isaac J. Manjarres (1):
      soc: qcom: llcc: Support chipsets that can write to llcc

John Stultz (1):
      soc: qcom: rpmh: Allow RPMH driver to be loaded as a module

Jun Nie (2):
      dt-bindings: power: rpmpd: Add MSM8939 RPM power domains
      soc: qcom: rpmpd: Add MSM8939 power-domains

Konrad Dybcio (2):
      dt-bindings: power: rpmpd: Add SDM660 power-domains bindings
      soc: qcom: rpmpd: Add SDM660 power-domains

Lee Jones (11):
      soc: qcom: qcom_aoss: Remove set but unused variable 'tlen'
      soc: qcom: qcom_aoss: Add missing description for 'cooling_devs'
      soc: qcom: qcom-geni-se: Fix misnamed function parameter 'rx_rfr'
      soc: qcom: smem: Fix formatting and missing documentation issues
      soc: qcom: smsm: Fix some kernel-doc formatting and naming problems
      soc: qcom: wcnss_ctrl: Demote non-conformant struct header and fix function headers
      soc: qcom: smp2p: Remove unused struct attribute provide another
      soc: qcom: llcc-qcom: Fix expected kernel-doc formatting
      soc: qcom: rpmhpd: Provide some missing struct member descriptions
      soc: qcom: kryo-l2-accessors: Fix misnaming of 'val'
      soc: qcom: rpmh: Fix possible doc-rot in rpmh_write()'s header

Lina Iyer (2):
      soc: qcom: cmd-db: allow loading as a module
      soc: qcom: Kconfig: make RPMH match Command DB setting

Maulik Shah (2):
      Revert "drivers: qcom: rpmh-rsc: Use rcuidle tracepoints for rpmh"
      soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()

Rikard Falkeborn (2):
      soc: qcom: pdr: Constify static qmi structs
      samples: qmi: Constify static qmi ops

Roja Rani Yarubandi (1):
      soc: qcom: geni: Remove "iova" check

Sai Prakash Ranjan (1):
      soc: qcom: llcc: Move llcc configuration to its own function

Souradeep Chowdhury (2):
      dt-bindings: msm: Add LLCC for SM8150
      soc: qcom: llcc: Add configuration data for SM8150

Stephan Gerhold (3):
      soc: qcom: rpmpd: Rename MAX_8996_RPMPD_STATE to MAX_CORNER_RPMPD_STATE
      dt-bindings: power: rpmpd: Add MSM8916 RPM power domains
      soc: qcom: rpmpd: Add MSM8916 power domains

Tom Rix (1):
      soc: qcom: initialize local variable

Vinod Koul (2):
      dt-bindings: power: Add rpm power domain bindings for sdx55
      soc: qcom: rpmhpd: Add SDX55 power domains

Viresh Kumar (1):
      qcom-geni-se: remove has_opp_table

Vladimir Lypak (1):
      soc: qcom: socinfo: add soc ids for msm8953 variants

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   4 +
 drivers/soc/qcom/Kconfig                           |   5 +-
 drivers/soc/qcom/cmd-db.c                          |   8 +-
 drivers/soc/qcom/kryo-l2-accessors.c               |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       | 147 +++++++++++++++------
 drivers/soc/qcom/pdr_interface.c                   |   8 +-
 drivers/soc/qcom/qcom-geni-se.c                    |   9 +-
 drivers/soc/qcom/qcom_aoss.c                       |   4 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   7 +-
 drivers/soc/qcom/rpmh.c                            |  14 +-
 drivers/soc/qcom/rpmhpd.c                          |  16 +++
 drivers/soc/qcom/rpmpd.c                           |  85 +++++++++++-
 drivers/soc/qcom/smem.c                            |   3 +-
 drivers/soc/qcom/smp2p.c                           |   6 +-
 drivers/soc/qcom/smsm.c                            |   4 +-
 drivers/soc/qcom/socinfo.c                         |   6 +
 drivers/soc/qcom/wcnss_ctrl.c                      |   8 +-
 include/dt-bindings/power/qcom-rpmpd.h             |  34 +++++
 include/linux/qcom-geni-se.h                       |   2 -
 include/linux/soc/qcom/llcc-qcom.h                 |   6 +
 samples/qmi/qmi_sample_client.c                    |   4 +-
 22 files changed, 302 insertions(+), 81 deletions(-)
