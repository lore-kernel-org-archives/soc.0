Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F473C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1074E64F50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1074E64F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=awo5KoitgFRHE/jUXeIe9/QNG3BL89LlJq141kBKC44=; b=RGysxvgihPka0G4Z5xqa7zqhr
	cni8iVrewUycPDunJZJ92BvF8I/3gLxTdfhUQQh9WfFQvKK3tkrYuGjWwguALwg59M6mHrDl7McVb
	tVjM4PV+S55js1kCY5cHDe/1o6if6k9tRB1k2I8LC3cfTMm7gvSLIniRirsDF4URqZj++zL6/g+78
	hrKQKtsEbiQfqipeqoEzvheP9FyJSzS1Fxq1tc2jdXm+1N4sCX1GoPqlZd2VW1FGRAbR5lo6sd5E8
	VOU1CjLw4M3t4XELQj20OoKcvvkJRWt37mwJUY+EPiZ7VGWJssTXUTqmYhqvKaMpON+T6CfsoqAAW
	EPiG3cNdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCT-0003EJ-6M; Tue, 02 Feb 2021 17:10:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCH-00039L-T2
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 944C564E08;
 Tue,  2 Feb 2021 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285837;
 bh=KAm1Ms8yUl6F24bCv2lLApmEGS7zZXGPeynlLD4XllQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T/lHb3JyxSOMtZsxTfd8Zgt5Qzn1+WjPYSv8pOxSA6ykVje1/h3pLvGVOoKRrb+pS
 MklQNGtq4iSy1T7qj1SMKOCrvLUuP2atwvX4WifGeB5zTQpOsm9waIE1TDZWgRyJfM
 M1Nb6PY79hSVZGh0wb3ZlH5ukEZm8bgk60sEb7oL8qfzaJP2BTCXaumkJlg0hwzf7X
 xTdlaPhPa/n9bt8ihJ3DeQ5RjCnTjL/PJ3dn6Rb8jU1wgLpAi8EjVq9esjPul8PGnU
 WtYdHP9dT3R5Ju1j42WNk2wdaFqtruWMUvdwIpRXOL8PNQyxTdx8Eq+sX/cyTiUIAH
 6Oa6neBcplO7A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.12
Date: Tue,  2 Feb 2021 18:10:13 +0100
Message-ID: <161228552203.1852435.15236332625313790243.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <48511540-fdd6-4fbe-8037-ec9fa8436147.lettre@localhost>
References: <48511540-fdd6-4fbe-8037-ec9fa8436147.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121038_066337_4B16BC69 
X-CRM114-Status: UNSURE (   8.74  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171013.udD6SmKkVXYWoS-j3aEflcbYRnrJgvPhfFP8S2URDSQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 19:50:39 +0100, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 29a6387c4ee7ef0b269c71c62c7b9770b91fa242

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
