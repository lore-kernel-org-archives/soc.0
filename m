Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FB8C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 19:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D503613DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 19:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D503613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2VEyi5bamfm7Fw8Uv60h1DGz9Omk9pMYm3in8Z7iDU=; b=I9IqDsxOc4q50w
	4591z+ezEZEG1Y2/SL0FHSsvAaJW4S1SIfOQreoZZ4kxw4Qwzf/8S5HON4ih/vZvgvv1OFQy1yhyS
	jG3l4MqRfihUNNYq5CaSwdYdfL8qajqAhZ40MSsp2ntYc4I4PEmgl4UTfZsuriCD2eGFLFy+PEuua
	CwsCXJAfoxzAXhGwABgZVCL4MU5arnlaNh40AleVGfi/BX9B+kxk0DpPGzDhYssUIRMzBtR01iAsM
	J/v4mxZUT+qhRvCP8eJNyfuVrA0YSxZUUgwTHMTKfM4bpH4umTm0CIYzX2bbZPSSMxftbVYqQpQ6V
	4v2sCyhUvTt9qYbiRmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrQgr-002Gug-7g; Thu, 10 Jun 2021 19:50:09 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrQgR-002GqI-RG
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 19:49:45 +0000
Received: by mail-pf1-f175.google.com with SMTP id d16so2479061pfn.12
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 12:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfkFqsgpL3AznhJI9IfIu+Wtx+Hx/3rGiTa6HqGFLyY=;
 b=Q2RfP2asf3CSsji/OQajv4jZ7eZvHrmOSVgYKF1XxcKCXXfco/GE2qHzeHA80NOjuU
 cC5wghUH/khpIpcLk6c13/MmMj2nDEOHExgQs20C4EqsQV7D2aMWIKRZer475OeJnx2r
 9bm3rAdBeeOwN9+8ws+VMpTIVsZ0BHxmIh8NErcGzFZFZEHqwk0QYGjGVtVmWPKpfV43
 JvZTniRrZMyk9JvZFYoQQhLMG2jEEk6mo3EuT8fVCeJ4GYZKL1NJlq3aoMD4KTy9ETiv
 WflaB+AOFgkoQCPO9fsAQKeecz2t4bvW5Fd8gBV11l+UhHKvnr7UW18VFUNY6z0kHE8B
 ivAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfkFqsgpL3AznhJI9IfIu+Wtx+Hx/3rGiTa6HqGFLyY=;
 b=hSRoc+ddvncWOjrKK4X5Y+byFe3rzMZePjiH2ao57L22sxYd1nTYkDwKEeCeAEank4
 Dw4Tp8js94eumOE0qP0upZ1Jr/XEZZbXJOwr/uYvkteuZ7vuqii9yZULUYX6OOeHXbW2
 Y3zGWo47as7WTS3J+eII3o9HU2jhjjE9IrxIoesfmQR91kWLgPCisbkX2vPtMgRjflYe
 qSm8745tFnXNE9EVw52zDEvt9Xzp4FzqIeYgOCrLnpYlv/iNd4yIDtGeLSEQeyU/ncCo
 zsazeT6pvBJsWtsShrw46xxGir8LrgLdRj+hksZ4+/6bDChvVjVigJ7TttFCO/69vZKg
 d3lQ==
X-Gm-Message-State: AOAM530kyyO2K5ZdrxkCExcuQydz6HcIzN838TsYawc51YqmLDRa+Sd6
 fRfyXn0GufA0+PgJ5PIQ+78=
X-Google-Smtp-Source: ABdhPJz+YwXnU+AdVmm62TGrYUB+6Dn54dkO2OBKuW4tVu1EN1D2o2JGb2ojoaD+3TgsJzFLFvyyng==
X-Received: by 2002:a63:7e56:: with SMTP id o22mr64617pgn.278.1623354521803;
 Thu, 10 Jun 2021 12:48:41 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id oc10sm3118297pjb.44.2021.06.10.12.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 12:48:41 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.14
Date: Thu, 10 Jun 2021 12:48:35 -0700
Message-ID: <20210610194836.309869-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610194836.309869-1-f.fainelli@gmail.com>
References: <20210610194836.309869-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_124943_901279_AC267C1F 
X-CRM114-Status: UNSURE (   9.79  )
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
Message-ID: <20210610194835.VlFBJi82J_lo9O4EhgE6u38TtD8jbPBW2Dy7cLZnWXY@z>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.14/devicetree-arm64

for you to fetch changes up to cd49f71cff8de325c7602bb2d072bc6d2807387f:

  arm64: dts: broadcom: normalize the node name of the UART devices (2021-05-20 11:45:43 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs changes for 5.14,
please pull the following:

- Zhen fixes the Broadcom stingray serial node unit names to fix a DT
  binding warning

----------------------------------------------------------------
Zhen Lei (1):
      arm64: dts: broadcom: normalize the node name of the UART devices

 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
