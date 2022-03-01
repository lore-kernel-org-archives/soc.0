Return-Path: <SRS0=PV0F=TM=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A04AC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 03:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6204DC340F1; Tue,  1 Mar 2022 03:38:41 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0B9AC340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 03:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0B9AC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso21136117oon.5
        for <soc@kernel.org>; Mon, 28 Feb 2022 19:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n40CeBynEW+1ZBWD62UetCPOnT3R4YBx5wB/UbvRqXY=;
        b=KzTh1tBDSqMxLARYauOeyLwcqMELW0TqVEzGSx4BIjVnkFrPHvecXHPiWh2Gw2uVSM
         cQKVEfw5feqnCf+dw/in0nn8PqL8OyyFBYiGeTSBGKKriQdwAfnvTvgPjz5QxYrdSYGp
         aZoB0GbjBoNjzEsDmKVUyh0ZXDSOtungxqmbcSAIuC4z82jmORQpp2gfCQ6rWXE8Ll1C
         tQGcma3rs5B3C/sO8Kmm4xsa2esUekAN49V5N7A4GId0CZwPhyXF1XoLBQT1IcaUTswY
         im1P3yJCc9seJf+WAEijyZ3yy6A+juANXgQZI1GTvY4Acn4aixoCFePgUCmsCyyFfJZo
         2Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n40CeBynEW+1ZBWD62UetCPOnT3R4YBx5wB/UbvRqXY=;
        b=RfIVScSCK8Z4Wtx/tmLievAWorno6qhLrjooWAli51CLelFgN9oUQnNH/nGC2/zXo3
         myq8wYLRmtYF+gxNAsRfG5pTG8hSDx//XL/CcaPbWQFyQW2FgvI8feXVCNJjfaHuxqDz
         yueH/Eox1QeWB1n8PENp537ErG+V8n3hyMeO72h3PbsvdIdThGFR5YQdJBLFNwlNLTZb
         SYDxlMdP2KrUVImQXcP3UqXOkCGsDZdZ67+MH70GyC3KxGVmiz5iRzn79DGaQIPNxFsz
         wFGIkIqEOlsYPy5jEv82mOWMSi/6ZmApqjL45UmqotfLobCBZvYUULt7qJdu27XhHecb
         TQxA==
X-Gm-Message-State: AOAM530VhyHs7W2JszzqNKSjPjuwvm30/xx5Vqo1+jnXDRSChpFLcBE3
	DOOuRfFWjagF+ToIQ9ABRNlQow==
X-Google-Smtp-Source: ABdhPJzTz7/sBKrsnpWdsf/YUVOUR+ZRClUh2EgE9Guw6DNIZsTuqk2ufir7z20+aFxwx7zksOeqjg==
X-Received: by 2002:a05:6870:8316:b0:d3:a001:96cf with SMTP id p22-20020a056870831600b000d3a00196cfmr10066982oae.85.1646105919907;
        Mon, 28 Feb 2022 19:38:39 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id t40-20020a05680815a800b002d48ffad94bsm7616153oiw.2.2022.02.28.19.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 19:38:39 -0800 (PST)
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
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [GIT PULL] Qualcomm DeviceTree fixes for v5.17
Date: Mon, 28 Feb 2022 21:38:38 -0600
Message-Id: <20220301033838.1801689-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ef5ad2608511596b8bd28f1e2b4fa8fadfd2f536:

  ARM: dts: qcom: Drop input-name property (2021-12-15 16:40:52 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.17

for you to fetch changes up to fc5a40694ba684fb3b7009819965ec38e829118f:

  Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards" (2021-12-23 12:00:24 -0600)

----------------------------------------------------------------
Qualcomm DeviceTree fixes for v5.17

The SDX65 platform and MTP device was added twice to the DT binding,
this drops one of the occurances.

----------------------------------------------------------------
Stanislav Jakubek (1):
      Revert "dt-bindings: arm: qcom: Document SDX65 platform and boards"

 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ------
 1 file changed, 6 deletions(-)
