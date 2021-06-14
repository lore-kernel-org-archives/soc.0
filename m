Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FF8C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2EA661078
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 22:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2EA661078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gt4CJyqv2SlKCpwJCCnpENwTSHlc06cmAqjTpxrcbQ8=; b=paAxBfQfpwuUO7
	AsFj4tE6YGTxVu/LwopKuTtFNMrw5Rc2k4G9uIlte8YDdylx4k8nIa8Uiuqsfk7SmoC57LHkUZltP
	hOvzGbzsr36FwA3tUFjVuriYxu4MlPUtABo1ZlGsNaVsocfPO1tm9IkEd120sJ1goJUV0t0CkZfNY
	v70bk427HtiCVbGHy9dyoq9EDk+Q0w3sXzX5ikeFdYoEa1sCWSbq0xBTmB240GrYZA6Xb/mprko62
	wb+xWWtql+KnTp1iynUQTutLohEpKSihZk2KSPPaoVtnSXvlaEP3B5601rXJFwxlXviipntJeQ2vd
	P6v/TCvKYQK49wPQbT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsvEF-00GRkb-Ny; Mon, 14 Jun 2021 22:38:48 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsvDy-00GRgh-59
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 22:38:32 +0000
Received: by mail-oi1-f177.google.com with SMTP id q10so11866058oij.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 15:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yCJ52grF54rdbIjeFuKyZZnsyoX/3BIGPZ8n4IO8+EU=;
 b=yVdyGuqZ3P2THxRnUH1NVeJNDitDPrGgm6/asHmu4uKSu9CU8uueBcO1jESiTllD9n
 HBMLE5liDKsxv8JzRnN0wkk1Qi4rv4F9/AVmlZeUX8DYnHkqEcTh5OiOfcn66WTYOCe+
 Q+YZvAKHeb19iqenhITp3YUcGjtZIK2XB9zygnJcwNR/Y7TZ3lPrw0JAri6ACTHOJrid
 NKSXnH0jvLCVcBI7wwJTr4imHdMc/GJvKAPGXD9PDhxq5vkZz/Arkg+IfgpMTSCSUm1u
 6NS1cFCNE9AmgHpDyAr10QchJsI8+WXXVhXz93zlaHK1Upgfd5ReReMqOOgIiGlO1PZh
 i1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yCJ52grF54rdbIjeFuKyZZnsyoX/3BIGPZ8n4IO8+EU=;
 b=AUGoV9oDPhoKDb0U1kDAtNOn+5b4bTTIR0LoSUgsUYdYaKCd/20YDmnRL3yyJ6GKSl
 r0F/m3l14QKtN8llzkexjqcOy6HzdX3tPhim5Q5O0pz5Jz86V4WdH9Gx8H2ledbZJXzB
 ALcTcTXtPaZYh69+xTM0bWegoQddSUz1XXq6E/CGut48e7rY/jmJwa5esOTd08I7aCDe
 NkREG9TGx0sgAZUT42XhXKUD2q3zX30cfxUiqy8TCmsghbmkKBj9t83judRQWJ2BI+Ej
 pt1mRVx6p+umJlkZFFlpaJFypJlhniHzGlOI82Yn4w3rsX01HitZdiyoWQMzRiXo9dMA
 s+eQ==
X-Gm-Message-State: AOAM531zsPRIPm4hmj87axD0y7RuLrAeJJeETW49j7YFTUwZcvHKIaU6
 IRd4hG+jDh2wv/a52XGbLMAcow==
X-Google-Smtp-Source: ABdhPJw7GgHFPNAQq0T/ibBoT4T+raATRbZLLGZbjyCGm09WZ4aFwCM/2lFR0VaQmOeVGzbMJ3/Fng==
X-Received: by 2002:a05:6808:1511:: with SMTP id
 u17mr938076oiw.53.1623710248975; 
 Mon, 14 Jun 2021 15:37:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z14sm3640590oti.29.2021.06.14.15.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 15:37:28 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Martin Botka <martin.botka@somainline.org>,
 Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Luca Weiss <luca@z3ntu.xyz>,
 Lee Jones <lee.jones@linaro.org>, Robert Marko <robert.marko@sartura.hr>
Subject: [GIT PULL] Qualcomm driver updates for v5.14
Date: Mon, 14 Jun 2021 17:37:27 -0500
Message-ID: <20210614223727.393159-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_153830_243717_9CC36E94 
X-CRM114-Status: UNSURE (   9.53  )
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
Message-ID: <20210614223727.8-VToEg_aaWaKWlzP-Pwm1NKSZ8T5WGRBC3RoJEhBE0@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.14

for you to fetch changes up to 82a6cbf007648e2c07c29a133cce060fc30aa48f:

  firmware: qcom_scm: Add MDM9607 compatible (2021-06-10 11:26:45 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v5.14

In addition to fixing a kerneldoc issue in the qcom-ebi2 driver this
populates socinfo with a range of platforms and PMICs and extends a few
of the Qualcomm drivers bits of support for MSM8226, MDM9607, SM6125 and
SC8180X.

----------------------------------------------------------------
Bartosz Dudziak (2):
      dt-bindings: soc: qcom: smd-rpm: Add MSM8226 compatible
      soc: qcom: smd-rpm: Add MSM8226 compatible

Bjorn Andersson (2):
      dt-bindings: power: rpmpd: Add SC8180X to rpmpd binding
      soc: qcom: rpmhpd: Add SC8180X

Konrad Dybcio (2):
      soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
      firmware: qcom_scm: Add MDM9607 compatible

Lee Jones (1):
      bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'

Luca Weiss (2):
      soc: qcom: socinfo: Add more IDs
      soc: qcom: socinfo: import PMIC IDs from pmic-spmi

Martin Botka (3):
      soc: qcom: socinfo: Add missing SoC ID for SM6125
      soc: qcom: smd-rpm: Add SM6125 compatible
      dt-bindings: soc: qcom: smd-rpm: Document SM6125 compatible

Robert Marko (1):
      soc: qcom: socinfo: Add remaining IPQ6018 family ID-s

 .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  2 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  2 +
 drivers/bus/qcom-ebi2.c                            |  4 +-
 drivers/firmware/qcom_scm.c                        |  3 ++
 drivers/soc/qcom/rpmhpd.c                          | 21 ++++++++
 drivers/soc/qcom/rpmpd.c                           | 22 +++++++++
 drivers/soc/qcom/smd-rpm.c                         |  2 +
 drivers/soc/qcom/socinfo.c                         | 56 +++++++++++++++++++---
 include/dt-bindings/power/qcom-rpmpd.h             | 21 ++++++++
 10 files changed, 126 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
