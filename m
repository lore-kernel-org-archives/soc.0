Return-Path: <SRS0=86YY=JB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3110BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:51:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45DB611EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Apr 2021 16:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45DB611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZLICubq5rWxV7Cf7rHrIGiYZ0c0z+i9E92j03yofME=; b=D4By5Mlnn7BpZqGL0OF0xMeyRw
	51Qqh7ZanwyGxPcfKbG2JsOEdTkqj2rDA+9M3/okP9rVAq2g1dlRZDX2DVT6G13zFa1UpInPiuQAC
	W7E3wJgap+XCCaSDismU5IDBLW4v8PRwV2RfueKx1gDmWFwklWcIp8wRMriG4zXz6GMgOTSyzck9C
	PQVKOWdbP9iR/97D3z7zs9XO6iNbMNXHzxD6f/NplSesUcLmcVVblNYSivIQCZAIz4t5v1BV1J5ox
	sdInHymo7gxUVWg0t1vm92/aWKCwH9tL8rxJL6bQK334zr+o0B4tPLMiQkcN2VL8J6efU7n/M2H6F
	tyG3TURQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT5wq-00FziL-Qi; Sun, 04 Apr 2021 16:50:04 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT5wg-00FzgR-Cj
 for linux-arm-kernel@lists.infradead.org; Sun, 04 Apr 2021 16:50:00 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so9407477otk.5
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 04 Apr 2021 09:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xTMgW45Pf8wC7ZRL/3TK62BwJGeS6Chx/bVTjL7mA8=;
 b=nk2BEyZT3RueLrxOExLKWBZJ4EKVhn3pOd321Mci6cTy9UF10XDahELujCxuwySvUG
 B2Ncy1Ibr8C/BV431PRL+pG/rtYU7DgQRQ/QBZtv9lQzB+gV/6gw9EnpQZHFNoileHEl
 aJk+FKh0d9iL+K+GwmkuQvvLH2lekIAZFXFnwENU2TMsCLeFpDg97YQdSuBkqAVD7ukn
 S1akeMTq+egbXQjJH87qf2r9+Dwyk6HU588mMZtrkqo4ZjxaMwmYjI6cemLhElQbPnLE
 c27XVgHV2hb9IK1ukCiis03sxeNkl2iF+HA5GDj6FKOPX+CIGd9StpJT+8vwzRZZ4DH5
 Fuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xTMgW45Pf8wC7ZRL/3TK62BwJGeS6Chx/bVTjL7mA8=;
 b=Bn2PL5vXIg90vrjlbFQ8UwtSPtlqc+r/hKGCWKzS5zpaB7IKIteYu9t1rQPq83OEPs
 amtIKT93BHwY9/xK5rX2jZDgwi8Xy8wDtlpMatUxTktR2OnhOhqhOlOiy3ReRuQQIVxl
 j+ymAD5Wznv62l5DfzmUpgASWSTk6PRbO/1UfGo+G/itUF/+h7x2GeaTzFdFG6BkMH1e
 1ogJavUvMLG+RMGEk6xl3wH93n3egfr86tZ8SNacuZDSrmkB/zypufJQ6XsUPoQgU5zs
 fRPvM5Jqu04UJSYAhdvoQ/4Thap9WTbUaWg2m5Y4Wim4rX7ZjzcP+MjlcReVWTZ1EJl8
 RWeg==
X-Gm-Message-State: AOAM533uxbriOM1/9NcofH6E4FgNX1EnE0C7mly89PO09Hry7uE+d7Pi
 TdWN+7z6IOY5OFFPFo1TzKAuOA==
X-Google-Smtp-Source: ABdhPJzsBh85jkPN+kupmkbaUDVIvy3owM/rhUReliF+WgCmBH3OAadg8PUmUrCoHGwPT+2ljycS0g==
X-Received: by 2002:a05:6830:164e:: with SMTP id
 h14mr19956152otr.200.1617554992963; 
 Sun, 04 Apr 2021 09:49:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e34sm3379081ote.70.2021.04.04.09.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 09:49:52 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Pan Bian <bianpan2016@163.com>, Sibi Sankar <sibis@codeaurora.org>
Subject: [GIT PULL] Qualcomm driver updates for 5.13
Date: Sun,  4 Apr 2021 11:49:51 -0500
Message-ID: <20210404164951.713045-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_174958_424803_BD265FBF 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210404164951.-8fk139e4qn-xmNrjcsGrGlvMH6E2B1CdgInb7h-Zos@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.13

for you to fetch changes up to ac6ad7c2a862d682bb584a4bc904d89fa7721af8:

  bus: qcom: Put child node before return (2021-03-29 22:01:27 -0500)

----------------------------------------------------------------
Qualcomm driver updates for 5.13

This introduces SC7280 and SM8350 support in the RPMH power-domain
driver, SC7280 support to the LLCC driver, SC7280 support tot he AOSS
QMP driver, cleanups to the RPMH driver and a few smaller fixes to the
SMEM, QMI and EBI2 drivers.

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      soc: qcom: Fix typos in the file qmi_encdec.c

Pan Bian (1):
      bus: qcom: Put child node before return

Rajendra Nayak (3):
      dt-bindings: power: rpmpd: Add sc7280 to rpmpd binding
      soc: qcom: rpmhpd: Add sc7280 powerdomains
      dt-bindings: firmware: scm: Add sc7280 support

Sai Prakash Ranjan (4):
      dt-bindings: arm: msm: Add LLCC for SC7280
      soc: qcom: llcc: Add configuration data for SC7280
      dt-bindings: soc: qcom: aoss: Add SC7280 compatible
      soc: qcom: aoss: Add AOSS QMP support for SC7280

Sibi Sankar (1):
      soc: qcom: smem: Update max processor count

Stephen Boyd (3):
      soc: qcom: rpmh-rsc: Remove tcs_is_free() API
      soc: qcom: rpmh-rsc: Loop over fewer bits in irq handler
      soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition

Vinod Koul (2):
      dt-bindings: power: Add rpm power domain bindings for SM8350
      soc: qcom: rpmhpd: Add SM8350 power domains

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |  1 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  2 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  1 +
 drivers/bus/qcom-ebi2.c                            |  4 +-
 drivers/soc/qcom/llcc-qcom.c                       | 19 +++++++
 drivers/soc/qcom/qcom_aoss.c                       |  1 +
 drivers/soc/qcom/qmi_encdec.c                      |  8 +--
 drivers/soc/qcom/rpmh-rsc.c                        | 65 ++++++++--------------
 drivers/soc/qcom/rpmhpd.c                          | 56 +++++++++++++++++++
 drivers/soc/qcom/smem.c                            |  2 +-
 include/dt-bindings/power/qcom-rpmpd.h             | 26 +++++++++
 12 files changed, 137 insertions(+), 49 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
