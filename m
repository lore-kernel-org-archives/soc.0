Return-Path: <SRS0=+ow/=JQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72352C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 15:23:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72F061007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Apr 2021 15:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E72F061007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tetgYoQVUn5uPLAf+P5CkN6eeCNWBPyR5L7F349GuuU=; b=Bg71MHyqc46Ei0AJ0MfZ0oqmY7
	YRotfWnJTCEE+c4sds3lhFyVG+wxcLzEgS/sppYf3sJKH5ewlpBxlX5ZRdPjqWhU1ITiiIguBDumb
	+wboqt2VT/uIUaYK0nQHuc/1Qk58cXvsZzpJ6yGL2P+zqLYpZpb+A5izv9LLHIqt8TNQgCablJCQ0
	eIQUgIXAt4Vk9EPfhHsfj++DuPtDsBBYhzXLVMmcTiYuA2b7xDH5Rd386V2r4BroVhFpUbeggGV/9
	mTOQk4XyeWLYrk+XVFJxaoAl3wDL8N9ceHFZn+SmlF/TK0G2F0NI43kcOCvXhGV0VlKk1cBt/mBQX
	Txmn/TwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVil-00ABJ2-Lw; Mon, 19 Apr 2021 15:21:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVii-00ABIi-Va
 for linux-arm-kernel@desiato.infradead.org; Mon, 19 Apr 2021 15:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=; b=CbMMW/k552Igptc9/mFb9DVM37
 o5HkbDbaesrx3zR0tgIgpqpkT8tiqz45FvOBXS0x6ytC/EhV1MAGrl5ZoKIzrP3+fIa2Tw3dnihJX
 rwKSV3BcrOZdRXzJBtSypBHf42j2G/Fj4v+oKECnB4HASx6Zf0kAaxzNcUDJe6A4dYHQF2eIlq3db
 aaVxC+aRoq19N1NQoOLF8Fc6PTFr5ccd8nP8SRxDNbeBToCqHQs9CHrW/+QmghcV0UqLt9tRZqd5o
 TKBlfu7QkugbQwrDYv8qsukWZyPyFxHRoNB6YWG7AZzJN6dESzbymxwCkD+jd+xsDBA1Ajm5wQCyU
 JsUrGyDA==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVib-00BU4A-W0
 for linux-arm-kernel@lists.infradead.org; Mon, 19 Apr 2021 15:21:49 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso18831034otm.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 19 Apr 2021 08:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=;
 b=lmsoshBWCDGMUKrNLB9AlLYCqcSmgLNDLL5NNR7cwYziJT6id/hqIJtURNpv6/t7gp
 9m4UtjONinFZkMm+YVacJ6efnbcDxgkrtFvQwmu6vaNRP4jhAy+IiyCpYYsgJ/bti/gz
 ZNs7gDhFXXNEk2ABZVcBqgbSnP3frwgkrBTVkeZbtlI+tQzSkTLz3EOiZtVxU5+Mx0vE
 7e6SNQ9Ci7nhSvRgMuviMAVJQErhLDBUueAFTcgP1EQHE36JhnDEIHOcH9k4QB3K5+tR
 Vk+yJusQaNXgTfGN7mYmrzZ/JMl/FZbdj5DqoJrWjfp4i/KXpyDXe3O3P8EfakPmngqz
 E9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7q7bqxk84+tZWLx+S3rG1WzdRlKLYf+MiQJMKigSFd8=;
 b=AK2oQawLqcgzSI39io0on4CIXXBBsSYjdT6ZdoMXJ9rrc7eTjAmAPButPt+MGC6NN2
 av23nEkEBHGjZ6zrZsqQy2bBnFvJjHn95W+Fvm4lFmkIRIaxqU5H86SRCgjzKp4EPhW6
 u8vLVsEMGcStMHW7EMHxSPDj7hnfq8V80yRIGBAQVjWiXKVhKMjEHfgoBLlz8YZmkM7J
 u97Pn+xC99zoE2ZVmn2/G93FgrnDWol7iSfMKlg41r2S3jcUyorhXs8Bh4CD1xorYc+J
 AJTNn3+5hwt1WHNjqD7uZMNNKU+7xy8ch7UdUuV8EBcE0cBT3ZexNOOSqQR9o5F65l+v
 1MaQ==
X-Gm-Message-State: AOAM531V9OzoygCkjIwTXE05oVjqRDaxzIsUSi3o5YNAg4ci8kI7obVM
 YhL3zzKds+NU3chaDg8CC58JZfGEhFidrw==
X-Google-Smtp-Source: ABdhPJwvTvnVMh2WJXmsPNvKt0j8k7ttDwSes8duCvTdlZhTFqE07cJvD154/leTHrPv6Rh2ogPGxg==
X-Received: by 2002:a05:6830:1f12:: with SMTP id
 u18mr8412677otg.132.1618845704569; 
 Mon, 19 Apr 2021 08:21:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t19sm3622469otm.40.2021.04.19.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:21:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: [GIT PULL] Qualcomm ARM defconfig updates for 5.13
Date: Mon, 19 Apr 2021 10:21:43 -0500
Message-ID: <20210419152143.861934-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_082146_049107_9B5BFC34 
X-CRM114-Status: UNSURE (   8.86  )
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
Message-ID: <20210419152143.04oLNHCeIi-3t8V1WDkj3tRMI-GLSOe6I4lfAuwYFOQ@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.13

for you to fetch changes up to 7de91b665600c96b1fc66c4c5a679db275c0c674:

  ARM: configs: qcom_defconfig: Reduce CMA size to 64MB (2021-04-13 21:21:22 -0500)

----------------------------------------------------------------
Qualcomm ARM defconfig updates for 5.13

This enables all the hardware support currently available for the
Qualcomm SDX55 platform in the qcom_defconfig. Due to (current) size
limitations these changes are not done in the multi-platform config.

----------------------------------------------------------------
Manivannan Sadhasivam (7):
      ARM: configs: qcom_defconfig: Enable APCS IPC mailbox driver
      ARM: configs: qcom_defconfig: Enable SDX55 A7 PLL and APCS clock driver
      ARM: configs: qcom_defconfig: Enable CPUFreq support
      ARM: configs: qcom_defconfig: Enable Q6V5_PAS remoteproc driver
      ARM: configs: qcom_defconfig: Enable SDX55 interconnect driver
      ARM: configs: qcom_defconfig: Enable GLINK SMEM driver
      ARM: configs: qcom_defconfig: Reduce CMA size to 64MB

 arch/arm/configs/qcom_defconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
