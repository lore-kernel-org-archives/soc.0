Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68C4C4167B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63DFC23B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 23:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63DFC23B16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJPhYN1c0ui/45tTmsWiyVj8TYHNLeN0PkF3MEJTYbQ=; b=QFGvrwdfYK1GiVfcL9/CWfEhP
	6/Iii29HYex2qyBb0aCgGVVgpd9mpml8TVexxfzcw+fJ6A2iWTbFBtXWgQtrWqsFQwpIbZJfbgsDb
	z3vu+NySK9m/o4Lr/6XogwDoesp15bQoWFsGi65fL5QhMKuEaZKoKFH7Fc5ZHUlKQnNgju42NQWuF
	9qO+Af+/FVTYGpMouHBr77miX279t2QhJ6LbhcpViulzkyFoJQnqIqwNqA7eI+BYeZUYUMunPDIRc
	qmnLu58KxHCoVOhe0H60Xe3U7P2BmjNA9Qx+BiGu+cdVAqDOuWIT/j+Qz+XjHG9UtOcUpCKBPZuZp
	2+5bVnMEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmm7r-0005Xv-6t; Tue, 08 Dec 2020 23:10:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmm7o-0005XZ-Fl
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 23:10:29 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [GIT PULL 3/5] Broadcom devicetree changes for 5.11
Date: Wed,  9 Dec 2020 00:09:38 +0100
Message-ID: <160746884441.2839681.14095199165753732675.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128163410.1691529-3-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
 <20201128163410.1691529-3-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_181028_612241_150D13EA 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, khilman@kernel.org,
 Pavel Hofman <pavel.hofman@ivitera.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Vivek Unune <npcomplete13@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, olof@lixom.net,
 Kurt Kanzenbach <kurt@kmk-computers.de>, Vladimir Oltean <olteanv@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208230938.8jK6Q8dXs8jFopjNgf-Rb-FbSiQvAET2z1F9ib5lpe0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 28 Nov 2020 08:34:08 -0800, Florian Fainelli wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c8b53b1c6b9330ebee782ca28cc824fec50064de

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
