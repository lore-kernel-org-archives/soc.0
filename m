Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964B4C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B63E61359
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B63E61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7n3aNHf1DqAYtJT2tmdkRwf3WiewIWiqwQXEICWayQQ=; b=UrYrrHtR1MUeAx
	4LOfKUMGu26b41wfZar7loWA2LcT9BvBJamMDGMNG5JeVeD5HWilTlcHOzUyf7HdKTvvYl2oI7ZXL
	aAn+NbeuaEIFMlMDYKNTWPFM9Lfsf+Tts5VNuap+PUVpHkegf1GzHaHxl0TeMf4Up+/94vVDdkp/u
	qeaR/FGYFEaCgZLfuE4g/neHu04ci5zUAb7mkZEms0LMegW2+PGytwB21+bVdQNvrF+P78cf7MUNK
	JweOOkRorrAYvzIG0Qs+C86jgukCpZRDMEIwim8FMrZp215JhBPrYfAYqmARBBkEsxJDbB1kRv3c1
	YHUe04Z+L15hL5+tKZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDBo-004uUX-BO; Wed, 20 Oct 2021 15:07:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvY-004q4E-5S
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EF2B61359;
 Wed, 20 Oct 2021 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741447;
 bh=WWqkNo8J+ICdTfrO8OLG8oeSD+W8ndSzuylXmDOc4v8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SWE5GIINYwsilH4F20iVIJu+lmukg0m84+G5C30Mj2gPqqKhcuMOtGzfw7Jr0TcWo
 gqYs+XyeRxZz56qirp/BSnCrcBY+hEoGmv27KcxoA/bVny19gYZai9dU1NZ/1z4+44
 YrGviThahjXDgSpK4gH98USJL31KTEgiXiKcHLSZxRCDAK9hlgH0SD3yHwIe0Cj09u
 ro9KAbGtTwMj1QRctqQrQmoKC1BBoJqzWh3JGHwKgvjGvJLylnG4pW+P0FkTmR0IZv
 osG9VjR3Xl9D7jFdHEaJHR+QaFVWrVilmw036qsyS6R4IKldJkdw6rfF/gUNcPshXH
 Uw5m2qpoZOj7Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 olof@lixom.net
Cc: Arnd Bergmann <arnd@arndb.de>, yuji2.ishikawa@toshiba.co.jp,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.16
Date: Wed, 20 Oct 2021 16:50:17 +0200
Message-ID: <163474139779.4099414.10629589892566771876.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YWoH3g7vU1ZEAp+P@toshiba.co.jp>
References: <YWoH3g7vU1ZEAp+P@toshiba.co.jp>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075048_267465_C358FF93 
X-CRM114-Status: UNSURE (   7.25  )
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
Message-ID: <20211020145017.GnFD8NKEtp-dqkFuZGsHZ1clxKBvmR60CfRpu-fr9xs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 07:59:42 +0900, Nobuhiro Iwamatsu wrote:
> This request includes the PCIe and VisROBO VRB board DT patch for the
> Visconti SoC.
> Please pull for v5.16 kernel cycle.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 06ddf8fb43370fd2ce5e2b66a77d159ae13b388a

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
