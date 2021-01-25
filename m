Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F7CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 23:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A44229C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 23:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A44229C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rlMFNX0qvuT7dngCpDAnqSu0qRqKVbTYalI4TAQt6uQ=; b=08hpstRFeONjWIODr8wsjXJMId
	52/wArEktVG8EA3uyhKLLc1p+f0/T2Pw/wdx+k+n9jagbgga+Fh9/r4AtQyCs/XPbW05bu1UDHSCb
	/LZtqYpvPrNhsFnt1bsms4gu/J37F7Frw8JYZdTeJ7A6SiUkB9MGPHFK1fEkyWJ2SoDEUMvyNz+pU
	94ZVPDTFt25ppCMErI4Cq0hBn5ROBHTF/ndQwk2TWs5VekM+PZ5+Ono8quHPCBV282xex5HchH9AX
	+LJ6B8x4AGliQnkJwCsF/bFk+vJkyGpolZCygjJxM3sAH/DIMEQ/ELt78Hb3f83zKXCoanG504iXl
	sIOLyMvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4BDX-0005xt-7r; Mon, 25 Jan 2021 23:24:19 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4BDU-0005xJ-BU
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 23:24:17 +0000
Received: by mail-oi1-x236.google.com with SMTP id i25so5234762oie.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 25 Jan 2021 15:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxEcU6b+RmfdibISUxArgxsBfCRGKrvIT+AEAVhb/DA=;
 b=xAOnjRjaC234JB+z/tRn7AjkeBS3vgpqdr/mD37Hnm2zzKhZCx3e5Q3D+kNZooWqP4
 XUSlyGhEy+msWsgZI6ksdiBDeYiDKg6yZGPxAvk9yKhtCa9HYOCDChORMy/1iHvrE0ub
 hFzpr2ZDULt3p4UyS9N7unl1tjBidMVlfDr1qOMd2c7zLAXKf5/b2sZ/5cc7kC8/uluf
 nZLHQKl8gYGISZC+caolK649i8Gs9OlHquJRPIAMBuAwv7VlzzZDK5qlXhdHJ9UBqPSe
 0X4KJtM6aTnRkDANGiVof9zcZCMgYAfzfzvjRpgsuRmaZ/nSQ+3c+my9hoH8851VSB5F
 6aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxEcU6b+RmfdibISUxArgxsBfCRGKrvIT+AEAVhb/DA=;
 b=eh8k0t/69LJbSDYfa8V3anJW4aX7D2KLeBEW7IJx4nUSYa1Xms3LV3/U7TlbX2cn6S
 vI6h3dqJZBe5eP/75bsHZHJmoolITD2Oi1ZtLp9CaGo5ajMxxaYS4iN26zOo2HnHEwB3
 aaLj0Dax7LVwd+QgTL0Ik16ThEngkL0ai11PEscEO8INE9Cx/kU7fDNivx+NXQAdoR0z
 ZG27Rgt6SLvYjols+O8r02ML0utjNb6HtYqNWu/s8FLWuHkTvvRVgVf17IeXafH04UK/
 bcCxB5x+oEqxJ2ad1Q4wvQnS4za7hT562qPcDIQ3P2zzNOvtBetrY5MHPNIxVS6p08Yu
 NDEg==
X-Gm-Message-State: AOAM530F0H/kQBcCks867qKOcVr+clDzNrYtzw0OAi8GbpgUZmZbj+Nc
 Ocf1zL/5dBf/cHy8n1PXfHczFA==
X-Google-Smtp-Source: ABdhPJxEaffWeUuF51yZPFUPw4waATGBvom/UkEbjzaK0d30+T7sFUeF+aViZv0adupAKmFWzkbjkg==
X-Received: by 2002:aca:ab08:: with SMTP id u8mr1536302oie.84.1611617053440;
 Mon, 25 Jan 2021 15:24:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 68sm3759386otr.16.2021.01.25.15.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 15:24:12 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Qualcomm ARM64 defconfig fixes for v5.11
Date: Mon, 25 Jan 2021 17:24:12 -0600
Message-ID: <20210125232412.642834-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_182416_710032_B6B98618 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125232412.9shpNkUp9-HG9kHpWCABWLxpaur1DmxHNtOfXcJsSvk@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-5.11

for you to fetch changes up to 5b5465dd947cb655550332d3fa509f91a768482b:

  arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin (2020-12-30 11:07:32 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig fixes for v5.11

Devicetree patches for SDM845 introduced in v5.11 requires the
platform's interconnect driver to be buildin, or the kernel will fail to
provide a valid console when we hit userspace.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
