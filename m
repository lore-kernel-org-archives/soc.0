Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48290C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C766054F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11C766054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIYa9JutcuRQqZeykgN5uOKoTAx9IITmiEsTHOw79Hg=; b=lxCKi4oxX8klcv
	rO+P5quWGaJ5Au5tOQoLlf1FF62gA5mnoB37IDdG7z/3dbg+hbtuErUgXmBY4snUfCb1hPtQc1QOD
	0NRFfHHOK7bfHjN32IqwwEZG0HV6yl5xKMieX6q+YyczxmtRpMVvdl0POwIqEj4og/U7iAex2Nro8
	OC3DwLMITs+ZdukpYEwq1qzTQ6POv1/TxIkVBTuvX2dDTDCsSVgHNH7V/Aj4fcDZEklN6VJs/+OFj
	5Ttf5u/QEFzpd7AO4k9fYWijQpcCSuyEM/Ql35rJCnVhH82g/S07TGanyrDR6Fudp30rOYuoOB8T3
	uiA7XdJSS2cASwTfM0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFkFU-000OLw-Mm; Mon, 16 Aug 2021 21:34:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFkFD-000OKY-H7
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:34:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8D9660F46;
 Mon, 16 Aug 2021 21:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629149647;
 bh=d80uXTMxW1pO0QATDsUyZ1RBrTniSVeKF84TRRg5Xes=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ksx3zfUnygjrm3gOr5Pj6kikv5zP/Onn8pLSAaZ9Q0PCrcgS+RDoMy7yJqo43T28f
 YNgTAYfeF4kbDyqY0S39Hmd0h4qbkatGGr3OnaXcv1Nml2L+UcG3PKIoZG2dK2EOtC
 6O+JytFW5br1030Rn/nymR2MxCe11xx/+Nh7RI/pfive1bpwZbW1xFesrvCH/JaL7z
 9f4nrCyR44+vzANFZlcCrijgDfKHGuLibsIootYbEVmmtLFLSmtsS8MFr2pCzccceK
 r7+lZI++/WDPJUT+sE0VoKtMvhxKx/NgOQ4zCzIRmvHLMW8dKJjk4et+cy+C2/47Ek
 Ouq9lgz0I+thg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 5/6] ARM: tegra: Default configuration changes for
 v5.15-rc1
Date: Mon, 16 Aug 2021 23:33:56 +0200
Message-ID: <162914958916.240013.16079818037354285640.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-5-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
 <20210813162157.2820913-5-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_143407_631976_57230F3D 
X-CRM114-Status: UNSURE (   6.63  )
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
Message-ID: <20210816213356.iY3e6H182ZFTKjBRIcpTdIR8tDYbWtLWxJABeaQd-mo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:56 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 03bc43c09d0cd7f4a7813b10433d653ec5a02b09

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
