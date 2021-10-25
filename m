Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D6C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 06:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 736F460FBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 06:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 736F460FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4ZlB8zGjIVni57mvjnrNR+NG9cnWqSsIcbopqPgg3M=; b=ars9J8njv+/TBR
	Gk72OkRXFwzJhcJInb9uEm52LvlYmEi8Rc4gBd+3apvKXW9dI0e2IB4Q7mzUxhx/O0FYyGkeLpHa7
	fnMBr5XpKAqWDzjZAg56a7sA4k/FUrjkfYTzEWpW284zGMcpwPq3yt94b3L2zARLgAuPi57H7oKrp
	MPrCZvrULiuDKQBqy1mpQxPRzIO+LWz9C/iS7BrnR/+F8YuUFisWykLFcigPHoPbtwV8yhND76xf2
	nHJGlE2s/+nFWBZNebOJKkeIvzwuDrPRXTeBrzThitWtZ4HkqQFdqbcPdcPqseaTojDEYZT2d5nPU
	pKImEduCHptx/KyBbHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1metsd-00FSJj-2U; Mon, 25 Oct 2021 06:54:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1metsZ-00FSJN-Iv
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 06:54:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A59BB60E0C;
 Mon, 25 Oct 2021 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635144883;
 bh=aMM8nxIsnq28/SQaQXsgdHLfh+uLt3aqCHFseCYI4Zg=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=u9OAZcqtQOZTTuwy6Nh9JiM0xUnhh2YJys/eb1CgTxX4oFQH/2g7zw/8FnAblaWDy
 dqc8oAOYTWTmPm4RUE2Cr7rx6vFPzv5qTAm+OCydHXs59MdI502JCfthKlKgmACEpO
 EMlt0h1caUtJCEhooVuzPxrsyMLf+PqI6WlQUqZY=
Date: Mon, 25 Oct 2021 08:54:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org,
 aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com,
 jirislaby@kernel.org, giulio.benetti@benettiengineering.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
 b20788@freescale.com, fugang.duan@nxp.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Message-ID: <YXZUscHQt9YRbZG2@kroah.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-10-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-10-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_235443_669960_C10C3B1E 
X-CRM114-Status: UNSURE (   6.92  )
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
Message-ID: <20211025065441.YKExId0LwKGP0TcPllFqZXhvxL6IltJg_aItfxb7i4M@z>

On Sun, Oct 24, 2021 at 11:40:23AM -0400, Jesse Taube wrote:
> Add support for i.MXRT1050's uart.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
