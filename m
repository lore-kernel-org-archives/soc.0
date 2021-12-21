Return-Path: <SRS0=b6vg=RG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31790C433F5
	for <soc@archiver.kernel.org>; Tue, 21 Dec 2021 04:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFAFBC36AE8; Tue, 21 Dec 2021 04:04:57 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C857CC36AE0
	for <soc@kernel.org>; Tue, 21 Dec 2021 04:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C857CC36AE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f173.google.com with SMTP id be32so18942936oib.11
        for <soc@kernel.org>; Mon, 20 Dec 2021 20:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pw+dsyR/ln3/Tota3UpNDXsAPYMWq0lSizy4sn93ewU=;
        b=XcrkJEb2jvdXEZy61lIUUgsMTqTIEUw+gYRuWkdToIpfDiHYcFBudbBIoCDue0xZAW
         NyctgEbMS7LJJvdmNja8O3QmYbKGfIsSA8Xke4srwsgQkVUGs5a0tTr/cmIg6GiE5Z7v
         ntvovGEyCAzIGWxzLVlHcia41/wlSdVdu+ceH/JUJ4NXBLRIT5LFlYPa2WuxHLOzv3nn
         MA7qTcrqHoOYiJ/L9W0G0xP1UfkddnAKZh2ogjOE3zcC2Nvax9iIXOE5x811r3B2xdgL
         77/uhU+g/gIs5rCq1vTSQV5FANC6iFwc/jEsSCFcA/KC61cXMrl/z7FXVzVKo/jMXNQ9
         /0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pw+dsyR/ln3/Tota3UpNDXsAPYMWq0lSizy4sn93ewU=;
        b=PJuyhPbSGhXSN4Hj4YeK5sybFeMxBrxqpLvZRic9LABdseyF9HLnEQKns9Su9gETyO
         JImJXqyrcouoN1r2CivoJXnv5CppEEFSsLeY+RScZ7M0SZfOXEDl8faNkJnIG9jcGTAj
         BbdNfOzqSl8TPqW+hLlpYIg2D1v1Po11dfp2gTsqu7N7rxRnpDO3a1N7bHr/sM25jsWL
         oEnMkd8NNOXWCeRnZlJIX3n7pmXcq60wsXfFyBPu/QAjQ9xAkwn293pAFFSljgkYQudk
         vSSR1nWf7UMoGmTxKiZ1/djw58YjrOClHOTexjW1pspGAAk1U2Hj/cXuJUo2GqJ9yFqM
         RNOw==
X-Gm-Message-State: AOAM530Gpc9PewWHwsAfIZ4US2OMTvnhwVog0a+Gb4RHSYBnnOZFiond
	OFnbQk2AyIPUFqIC5/ZdymIazY0qX2zSRg==
X-Google-Smtp-Source: ABdhPJzCFD7IX9B+uUNj//iAFBO6MOzY73Lkb5BXbhx6ngBQ5kWgRFSS5uwylH/yRDKbj627tMCRaA==
X-Received: by 2002:a54:4506:: with SMTP id l6mr1153726oil.32.1640059495814;
        Mon, 20 Dec 2021 20:04:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s2sm3523515otr.69.2021.12.20.20.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 20:04:55 -0800 (PST)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Jason Wang <wangborong@cdjrlc.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [GIT PULL] Qualcomm driver updates for v5.17
Date: Mon, 20 Dec 2021 22:04:52 -0600
Message-Id: <20211221040452.3620633-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.17

for you to fetch changes up to e395f021ccebc239e4fec02fec47f5f0eef44ebd:

  soc: qcom: rpmh-rsc: Fix typo in a comment (2021-12-20 19:10:11 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v5.17

This introduces RPM power-domain support for the SM8450, SM6125 and
QCM2290 platforms. It them clean up the platform-based naming of the
resources definitions throughout the RPMh PD driver.

The last-level cache controller driver gains SM8350 support.

The RPM sleep stats driver gains support for several older systems that
had a slightly different memory layout for this information.

The socinfo gains SM8450, SM6350 and SM7227 definitions.

In addition to the DeviceTree binding updates related to these changes
new compatibles was added to describe the SM8450 and the Kryo 780 CPU.

Lastly a few typo and style fixes are introduced.

----------------------------------------------------------------
Changcheng Deng (1):
      PM: AVS: qcom-cpr: Use div64_ul instead of do_div

Dmitry Baryshkov (4):
      soc: qcom: smem: Update max processor count
      dt-bindings: power: rpmpd: Add SM8450 to rpmpd binding
      soc: qcom: rpmhpd: Add SM8450 power domains
      soc: qcom: socinfo: add SM8450 ID

Jason Wang (2):
      soc: qcom: qmi: Fix a typo in a comment
      soc: qcom: rpmh-rsc: Fix typo in a comment

Konrad Dybcio (2):
      soc: qcom: llcc: Add configuration data for SM8350
      dt-bindings: arm: msm: Add LLCC for SM6350

Luca Weiss (3):
      dt-bindings: firmware: scm: Add SM6350 compatible
      dt-bindings: arm: msm: Don't mark LLCC interrupt as required
      soc: qcom: socinfo: Add SM6350 and SM7225

Martin Botka (2):
      dt-bindings: qcom-rpmpd: Add sm6125 power domains
      soc: qcom: rpmpd: Add support for sm6125

Rajendra Nayak (4):
      soc: qcom: rpmhpd: sm8450: Add the missing .peer for sm8450_cx_ao
      soc: qcom: rpmhpd: Rename rpmhpd struct names
      soc: qcom: rpmhpd: Remove mx/cx relationship on sc7280
      soc: qcom: rpmhpd: Sort power-domain definitions and lists

Rikard Falkeborn (1):
      soc: qcom: aoss: constify static struct thermal_cooling_device_ops

Shawn Guo (3):
      soc: qcom: rpmpd: Drop unused res_name from struct rpmpd
      dt-bindings: power: rpmpd: Add QCM2290 support
      soc: qcom: rpmpd: Add QCM2290 support

Stephan Gerhold (2):
      dt-bindings: soc: qcom: stats: Document compatibles with fixed offset
      soc: qcom: stats: Add fixed sleep stats offset for older RPM firmwares

Vinod Koul (3):
      dt-bindings: arm: cpus: Add kryo780 compatible
      dt-bindings: firmware: scm: Add SM8450 compatible
      dt-bindings: arm: qcom: Document SM8450 SoC and boards

 Documentation/devicetree/bindings/arm/cpus.yaml    |   1 +
 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |   2 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   3 +
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   |   5 +
 drivers/soc/qcom/cpr.c                             |   2 +-
 drivers/soc/qcom/llcc-qcom.c                       |  28 ++
 drivers/soc/qcom/qcom_aoss.c                       |   2 +-
 drivers/soc/qcom/qcom_stats.c                      |  13 +
 drivers/soc/qcom/qmi_interface.c                   |   2 +-
 drivers/soc/qcom/rpmh-rsc.c                        |   2 +-
 drivers/soc/qcom/rpmhpd.c                          | 326 ++++++++++++---------
 drivers/soc/qcom/rpmpd.c                           |  42 ++-
 drivers/soc/qcom/smem.c                            |   2 +-
 drivers/soc/qcom/socinfo.c                         |   3 +
 include/dt-bindings/power/qcom-rpmpd.h             |  33 +++
 include/linux/soc/qcom/llcc-qcom.h                 |   3 +
 18 files changed, 335 insertions(+), 142 deletions(-)
