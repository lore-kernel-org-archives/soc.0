Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77CDC4332F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:57:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C0C610EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 13:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89C0C610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXVh+iX0/p6aGlaKDG6Y40Kg/cm24dw+8G0ZamoCIJ0=; b=jmcO2NaVIP2O9V
	Q2FYJbOT5cDnitN0O16r5vWUpy73zQmypBZVczGPCGF3P+ej7GJLQ1P5uhqFI/7uL/ZIsC4kE46eE
	YtUrrKBN7zmffej7qaqLsdpG/Ainrk9VbQsyfLt6gYbcRCLTKG2IT1x68HglT8/kC71XSnZyoNISB
	nWMzWnBwHlyEHZp2pXv49K6VB4mRGtLi9b6xu3QKDpaJWCgWxJxv6wF27F7GsVcU3oX5e6krBB6Op
	rU3HkwdZ3etXSuxkw7qg9X1/JS91c9vlR2oHTEYzyDWKqn/EL0tziB5OJq4WuZmNwkYvO/4BFTEJr
	+dWCKMYhHC2sVfzk+XjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXkvE-00AhsJ-CI; Tue, 05 Oct 2021 13:55:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXkud-00AhNA-Ss
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 13:55:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2EC6023D;
 Tue,  5 Oct 2021 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633442119;
 bh=dL0FGtRiz8iLH2Xof9EcpJ2EZOleGZqnCdSdnFG41iQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C3BDtsZWTaDWdli7a7B7xBL5Y0ffMsLsY7u4vu09KwS28DW95gFJYH8e0vUtAZSSr
 ryzl/Z0P4H3gKuBVVmg935RklhV7uQb7d5CfGuL0biebgmdchRNfOnQM97/gkTdx2A
 tiDlUeygQQwx4xwiVmtUkjlgseFo/uPuzz8Oe0S51uwRBmyOVolSMCBGtHmbSXhamJ
 IXQc3LdGlfAPKbSiyad82jsBhQeh0cNQjniWM3ZH96JIq5l/GM/z/TAYwqbRWeD2OA
 iP6l7xUrhJAAGtXX1slCbTnahzh/Wz4ukK/JXJV0TrjGAv5tiQP83wvMko9G6HeRWW
 k2szR2q+xWpdQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, David Heidelberg <david@ixit.cz>,
 linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>,
 Andy Gross <agross@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [GIT PULL] Qualcomm DTS fixes for v5.15
Date: Tue,  5 Oct 2021 15:55:09 +0200
Message-ID: <163344208489.2721567.9809348887551925791.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930025526.1146-1-bjorn.andersson@linaro.org>
References: <20210930025526.1146-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_065519_992510_41FACD97 
X-CRM114-Status: UNSURE (   6.70  )
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
Message-ID: <20211005135509.KkOxATJahhLiL01atDNZfFynGFUkt8JpBi3V4pBo0eE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 29 Sep 2021 21:55:26 -0500, Bjorn Andersson wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.15
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: c147392b652b6af7d96f1f844a4938a6bb4921b8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
