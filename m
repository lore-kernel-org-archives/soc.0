Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CA6C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC7E6103D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BC7E6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taEd5x+azN4Qv+aWr948erNQUJyJiNidGI+mzLA9wQk=; b=LSmToxG9N5QHPK
	ZDYB3R2ZxMOpuFZ7w5Air+lQavjlA4bg6j5i87yTsGjFCcS5NgYJ6cYACqaSWl1wXYYY5a1ZPp8Cv
	prZ6B6fwYJLX+OQtTI3J9Uen45FtWliWY2VTFZSWbmmY4KKLqHOBEY0owa0EsaMGnOhxzxce0C2SP
	LgSLvMhP4uHNhWPO3B57eYzOVDa/oIFzmWOZA2RC73/eE42yMO9JUdXziQ+zOrlNWVp/F3LJ7UYcy
	pQsas1AnTyAJQ5qDM8/AKNYDmmxmyLlNbXgqmez5aWYQ05rAInZCadqFS1QBcOkjHrHURHkVVWmHA
	ZyAVlz2RBbofx9aZs0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdD9z-004u0u-2o; Wed, 20 Oct 2021 15:05:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvU-004q2P-EQ; Wed, 20 Oct 2021 14:50:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35DA3610A1;
 Wed, 20 Oct 2021 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741444;
 bh=folnbwU/0sQ7piXTJc1Lh7Kr4R1HiJgqm3XjMFtsUJo=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Be2PYOxe4EFd/xTIn6l/gG4Sw9fOKhbbSumAfugZAf6WkIMq3roC6vIVImmRSDbES
 AQPI4jV2giUVFUPrdrPHyXTXjPXBVzRVk+DazMZyBynCmdq7YDwqL9cVni/gCxk0JL
 RLmPTBoX6QgatfvkFmOwCR/OFtSZpPbFsKRJz2joLtUG0JMolr65O8Dl7jZJ+KsBJR
 eub0QkhXVBjkfNShcI+I+bNAtte9i9Fs4QF6YXOKQg70JuAz/gLZHNtedDAGie7/X3
 8/PD8ZLknhB02CXHpauOOdypsk8iqitOWDj8NO0IG3F13NyrTGAzqk82zYalPZCGoC
 I6mau4myj+QXA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Kansho Nishida <kansho@chromium.org>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Re: [GIT PULL] arm64: dts64: mediatek updates for v5.16
Date: Wed, 20 Oct 2021 16:50:15 +0200
Message-ID: <163474139742.4099414.583373234441838179.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
References: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075044_548768_8D48B642 
X-CRM114-Status: UNSURE (   9.12  )
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
Message-ID: <20211020145015.8FZ0ztgqSaQE7qu42pGTcIExPj2sGi2caqavQWkcX10@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 11:58:34 +0200, Matthias Brugger wrote:
> Here come the latest updates for arm64 DTS cahgnes.
> Biggest change is, that we have now support for a reset controller inside the
> mmsys. This goes inhand with changes to the driver, that you will find in the
> soc pull request.
> 
> Please have a look.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: ba232d398aee515ee0f8d046ba391f03bed49bfa

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
