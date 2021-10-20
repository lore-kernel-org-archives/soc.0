Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172EFC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 14:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CBE6135F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 14:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3CBE6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIziDoShw+W+Z6yjh8zeEmBm1L5dF36iE8XXW9YjmGI=; b=GDt8ZBvZRlbJIZ
	tMxSFzceSV67S71FMHMScbFbaqsnbDrDNi4uBCSFFeVBoYrZy6EZSG3y7Yfe9cjdm6V1UNT7X4McV
	EARYxfX0gX/MQKxIzcpQ1pI7mo1tWmougnPks7s3pBRWLRmMeMMkF20ENEK/QNyXhlsjHwmAnhSOx
	oVt0yc+H/1pKYb9Fh+6DAgsJp6c8mppfi/VsnuGxFzvXzoQzUSsRy/E87P7LujA2QJcdRS8CCtLnP
	gTxn0pvafkqNX5e8WIv56B2CGyIGflsmXdq4IStUXJ6GTLArGs+MiBkqP4eNh8CD5UUsyFwseKaWu
	H2sGyQg8XIACUsHddQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCz2-004qzT-Bs; Wed, 20 Oct 2021 14:54:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCpG-004orA-M1
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:44:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0731D6138D;
 Wed, 20 Oct 2021 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741058;
 bh=w1HEOzqw9am88vvGSLDdAUDpJuhlNzmKJw8lfg6RO8M=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FAAbNyUiYhdsQKEjq0wiq+k0lWVZXUKYukWZ5iyuA+FaovKE/Edl96Ni1VhwAYF1K
 AHL1rUe2T41ot0Rrm959j1ZyU76aWkclcrEMdaJgkCqcZfEoqt2ff3k7HX3mlvBm1/
 BHCKUivp+JMFW99cANEEh9VO3W38j5uvQsHmJN8O4bWz/GwvMQk+SlPVR0LrFuySug
 ZKWKRLndJJOKQ41z5yebkJdJ2cZWvfK5Le7vcibnpNKOBL/4UbwDPjoJ85FewHhgxU
 ulSMSHqXKP6KnDFpKlA1ucRqNhG/HY/KRK0bPRMfl6fBN7tXjRXmR3vG6esh6rZ6ZV
 P77Gyj21BzPdw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v5.15
Date: Wed, 20 Oct 2021 16:44:10 +0200
Message-ID: <163474104528.3915621.6394652804482446474.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
References: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_074418_793624_4FC80359 
X-CRM114-Status: UNSURE (   6.90  )
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
Message-ID: <20211020144410.JAoo0LKGrcwZ6M4-vQFLzLn8NqYMTJ845xbXZ6Chars@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 19 Oct 2021 17:12:51 +0200, Philipp Zabel wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux tags/reset-fixes-for-v5.15
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 36b6dcbc1245a3b4dd6bc5cc6b0284c9f05cdddc

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
