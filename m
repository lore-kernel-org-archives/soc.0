Return-Path: <SRS0=wDPU=OU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACBDC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Sep 2021 02:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75366187D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Sep 2021 02:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B75366187D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zQUwFDXWWp31ISD/RdVRWJpJXhoIo+7X19zlfaG0KP4=; b=oxVs0pnTEIq84Q
	OlhmYgkXR1I/lxGpRHd61QCrYJC94C5sJEeRmlBQURVKN1FvytW5cKhtF5sAIV79nKDEFeRlZNPwd
	6B0MwTUzGeCenog5iYfejh1j/nLqnNlBTS8Ewnr9fVNi3aee0/76UXiSqcFi+fNeVegkr5t/EM8ht
	03azEzwC6Ib+G19Q8OWGlCYc6ytCAqd/HMizDRWKsxScWcQwiMLk3zBixcuFvzZ6e9BlElGY0Sccx
	1ncdcTLRzfRz+/ojvBp7PSJET+rAezEFt62vzk31kU4hHxxYk+ZaSsazRaeoci8N3qrh/yR7VK7pP
	SGwiHpqcLBDiSCvhkfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVmDu-00Cqnh-P9; Thu, 30 Sep 2021 02:55:02 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVmDq-00Cqn1-Ax
 for linux-arm-kernel@lists.infradead.org; Thu, 30 Sep 2021 02:54:59 +0000
Received: by mail-oi1-x230.google.com with SMTP id s69so5470191oie.13
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 29 Sep 2021 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HrZGk2QOLZiDDnxEGsK8VY3l94CVFkmXU/tTSNEJU5c=;
 b=eW+wTbYrNGMl45NShdlQuxzDg87x8LpSLA1rG772OS/NKKxetSBTmb25huclVkG89r
 9mZorpfWFhI8QPeLvyE5rkHK8ufwvyXRFXYC0/e1yIIkBKfsL/+2ssGsYJLZTu+ExE2X
 Xrt6y/h8ZNB+ITrhDOAhUoi+5A9kLkuD9bvBWu7NcOOQDD+xWt56X0Zm9+Py5Vag4/yI
 6F4BPEIdrfbs1vlnfEUahq8NyEKvq+RzYeU0Di0SWsm+8ptELma1pTBFR/D5bUxt1Gbb
 fZp790wr74SHF+Au3rRR0BJ1xgDurfqNg0DDLpsMLC2616YYD9EA1ETulb2acTgW+szi
 muoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HrZGk2QOLZiDDnxEGsK8VY3l94CVFkmXU/tTSNEJU5c=;
 b=M8/KizmBCopDTT8HV2eRRSzaFoMvZO0Oc4iq7v2uYT9NfSMtsMshspiTvOeZjV0Vob
 VGauib8yLU5tU54RbtGADi2eKWobjfB503k4lXBH0bRH9CeZIb+He/hxKGXiRpshKXNX
 lx0KOr2mC4SWQi3iEGzaEDIyX5TWpTDVcnDHgiEY0WIqb+MGoJhscSCCjlR7KEqNA/w9
 +4WAXjzFaYjWtkfdkPmPOPclGya9t/PdxQ5+borVhUigdtIexnSFDEIpCG0tmk25boAM
 FFEDBy7De49CaH+Eh+6Km/2/mznDqRmothv+/H+H1fupUOWLTic+2RPhPsDEnbl8GqF5
 7rkg==
X-Gm-Message-State: AOAM531gocbntEO7jR9RIbRBF/X8Pn7kRUItlFncm05Hv+1I7cFxR4nm
 7ibhOnW/AnLNHuMIQFw9d1qwiA==
X-Google-Smtp-Source: ABdhPJy0xUaZRc5TLnjtayBdipQC+LN8oEs9vSvCM+u98Rmys2chB+z3XjoVGD6Ekc6DU6sNPcXzdA==
X-Received: by 2002:a05:6808:178a:: with SMTP id
 bg10mr582638oib.43.1632970497371; 
 Wed, 29 Sep 2021 19:54:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u2sm346181otg.51.2021.09.29.19.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 19:54:57 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Antonio Martorana <amartora@codeaurora.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm driver fixes for v5.15
Date: Wed, 29 Sep 2021 21:54:56 -0500
Message-ID: <20210930025456.1035-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_195458_438225_3A7F9C18 
X-CRM114-Status: GOOD (  13.31  )
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
Message-ID: <20210930025456.WKiKXaas8l-KF6XtxQJwRmzDnr2tvh9lojF5QLGQD84@z>

Arnd, I noticed that I've had the QCOM_SCM change from Geert in linux-next for
a little while now and would prefer not to rebase my tree. I do believe per our
other discussion on this subject that QCOM_SCM becomes hidden and therefor
shouldn't depend on ARCH_QCOM again.

Would you prefer me to respin this with a revert of Geert's patch, or can you
effectively revert this as you're applying your patches on top?

Regards,
Bjorn

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.15

for you to fetch changes up to 4382c73a12b4cab537176011a36a3c019cb2a04e:

  firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM (2021-09-19 19:58:19 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v5.15

This restricts the QCOM_SCM driver to depend on ARCH_QCOM, to reduce
it's presence after becoming a loadable module.

It then fixes a regression in the mdt_loader, where firmware with the
hash segment marked as PT_LOAD would no longer be accepted, preventing
several MSM8974 and SDM660 devices from loading remoteproc firmware.

Lastly it corrects the drvdata associated with the socinfo device during
probe, to match that expected by the remove function.

----------------------------------------------------------------
Antonio Martorana (1):
      soc: qcom: socinfo: Fixed argument passed to platform_set_data()

Geert Uytterhoeven (1):
      firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM

Shawn Guo (1):
      soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment

 drivers/firmware/Kconfig      | 2 +-
 drivers/soc/qcom/mdt_loader.c | 2 +-
 drivers/soc/qcom/socinfo.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
