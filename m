Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994E2C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66DE8611C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 16:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66DE8611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=altsC9j1Seu+gpOe89KJeT2R2ZqhUCRxbi5bGKZeyZY=; b=JGuJ9vSlzWUy0w
	Mynv8j3LkJViSi8qZONoSNRiEDJgqRY8KdtuAq/gBU5/+HvsnXlGHkkpsrjWr/ETLlSVmatseXTgH
	CjQZYyWVfGGOcDVU0W9rf2SV0ERt64wL1GkuTVZOHpyNM+kOqQBbYkJqgva0/GcdOzPyLKUO8l4m7
	3wPYvzcuVmJ+1CMYf5X3/FPwwIaolCa6aNkrElz95n/A5ZOyiyFEMfL1zukklJnuwdEtawfBR5yq4
	/IomSUi9kw5vyco4UcwuVzaPky+TcZNKOr56mnF2bHq3R4MnT+axpO3avFy4aepkbT7ToWQYX88me
	HvXho7oroRX5WKIR4u/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdE8C-005Bbk-Ug; Wed, 20 Oct 2021 16:07:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdE89-005BbD-0g
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 16:07:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C96F861183;
 Wed, 20 Oct 2021 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634746072;
 bh=yGSDknLUynltSzqVuVtTIF0eYkbLFsO79faQI2/sf8I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZnR1zoY0UsifIRDE07aHDeAKBLLaEMChMNuxupxLtNPNJ8szByYW1ds/MgDwBR35V
 +TgtCvZpWrWdu9pzPzlhDpSyrObLh68aNEfK4gb8PLBW/KKBGcnYhzR5jn8lExUPqh
 CH+9swe/aYgGwgGLxKKV5JAkvPHgREs5VG0a8/ew7mFB6JHH2rlM+EyPHxvRJsO+0p
 ED0oKF7ADB/Aarlga6D7n05G0Qe7pBTaak0MIJHr8eUj+obqKpoYU2Nml1FV0FQ+hO
 Ipxaq/JEE775EGXIDnbs3iR46ep8OKwPRIfGUM6HYPku//wQ9kB6PtArISJzWXbe+9
 xOngX9sjh6cog==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <stefan.wahren@i2se.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Christian Lamparter <chunkeey@gmail.com>, khilman@kernel.org,
 olof@lixom.net, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Matthew Hagan <mnhagan88@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.16
Date: Wed, 20 Oct 2021 18:07:46 +0200
Message-ID: <163474606225.2486492.3794812434525126819.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013174016.831348-1-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_090753_106774_82F9B310 
X-CRM114-Status: UNSURE (   6.66  )
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
Message-ID: <20211020160746.vxTdxkhDUgoRotVTb92-qVu1UgVgExjEEG7bBsWBiZA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 10:40:14 -0700, Florian Fainelli wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4d3e49a3755c619e698625df2f31cc547b01f964

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
