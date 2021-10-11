Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EF4C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C704660F5B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 22:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C704660F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hd7C4xuf3cnwH1Jf+pVY285xYvga8rSa0fGHSfJYlg=; b=fZ3+23wXXeCFPd
	bDpoZKCJplQbu8l9bG2xuEnFUd/O0BBjt4MbZbyXPtFjGRdUh8MaF0EV4i6e7teRnY42nXzwyPuNC
	nAqoc4h7zZ2lNn25EZnEtizroJVIveJ9jYWlcxYAQWDZ21MtCmVYTMIl9+67dDFRwy5OpHtkfYViL
	vQDxeZtdpbykwdRZbkdPVpjszdtAyjBGpeTTPHQAQXLRY8zkqE29Zo0GrNy0ET8RosO3ZbeqrhXZH
	nRiN45+eR5KfgE6z8LVxehoegRG32Ig6KOvbSEjs6p6JhWLEWnk/prGdr/tMK6iiResGhK/Cxm5n0
	ne5blNF7T8KXJwWHp/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma3WX-00AqkK-NA; Mon, 11 Oct 2021 22:11:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma3WU-00Aqjs-7v; Mon, 11 Oct 2021 22:11:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CD2360F21;
 Mon, 11 Oct 2021 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633990313;
 bh=KbyZXYV+89ujNC3AHGmEX5i29bB5OJkHExGA3g06Qr0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eFU5s4SCy0qZeF+pPKiFynExN0oonrcRfSyb3OGWAQVcZIRjB9/kQ8gEzkLhoND+G
 aJi1RHCKngESLYeQkS54NrSgWmPMvkuSrcg1jAaSzMl2M34pjv5PSvd/yqz4ay3V1j
 adIQ41a5ih0g28jZ7A/eL7JuqOzz6ZOPT0WFo6nRM2qZ9jbFhMfPXmWPV1/wjaZ0Eb
 LOzLDt9/NoMmoVgsoKgiRn/4D8HMESNJe9y5YIeYiszuuOckPKjoltexVQmoMQ0rox
 wKQckAhkyH4zqmubW0fyZ7vpdQ/NBDsaZiSvfbB7QyLkL1fDoUcOIEG8S4cR2U1ru9
 a+07NTLDCz1nA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Luca Weiss <luca@z3ntu.xyz>, Sungbo Eo <mans0n@gorani.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [GIT PULL] ARM: dts32: mediatek updates for v5.16
Date: Tue, 12 Oct 2021 00:11:43 +0200
Message-ID: <163399027746.3049179.12954087095996639958.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7135d46f-5fb9-b46d-96d4-3b38548fe23e@gmail.com>
References: <7135d46f-5fb9-b46d-96d4-3b38548fe23e@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_151154_402541_45476B0A 
X-CRM114-Status: UNSURE (   5.47  )
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
Message-ID: <20211011221143.wpNxEcj00K-Qx51tPheFLL41aUVTqeBx5KZgFDIxVWA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 11:55:25 +0200, Matthias Brugger wrote:
> Please have look to the latest arm32 bit DTS changes.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 79619b7988a45197d9a22657d246057a9c8391b8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
