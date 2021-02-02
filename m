Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45050C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:38:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0094464E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0094464E4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2HlUCRw+atgw96Go7MJDT/LAqCQlSI3OF1osXetMdTw=; b=VXY93MkLB7LghABtkdHoUArJ1
	9gkOR7S+UXd4ZxWI1kdhfk5ltxm88Qvfbs8Vh7Q0Pkfsw87zOyO7gko3gEbSdBlzqu92gnZXMLJlZ
	0kLNmUvRAabm8Z9Y2wrZ3BkXqqC1UAFJIzVDZiY/RMMSmFApMNytMybC00JELxdOW2XnyuDO1cLNN
	xjCO+qDJHID7/xKOnPjJh9TFgTqpIYlyJxNB20j2RvOJ7x/hjfWxXk3sMHjdrwWq03XiwVaC70v1x
	prQFT9H/9Fuy1rQysU82r+9RyJ9c5Tg1MZzY8MyhdgEdTW9maHTsD3bC8AVQAjClBOduh7FZIQHg1
	Ik9tmMaVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73M8-0003Ud-Cl; Tue, 02 Feb 2021 21:37:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73M5-0003UL-Bc
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:37:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5035264F6A;
 Tue,  2 Feb 2021 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612301820;
 bh=09b2U8l6Dtctv7PhUR1xjpAHcPX/oMiMbNS8HK2Xb9I=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZRpwvtdBYi0C/xebF40kdGXTXIvv8PzHDdlcA0b67ZpEfos2casF4phEgucSIhrWk
 U9buaOXhZgPBAPNiUGhSMt//8bU0Yw4mPtqfmcJfpfKITTm6/tOcdLud9idsoBM943
 W9AE5XZdogSWiFyq/ZXqG9/6gtn27y8OqZGAReX7SEUtPipZGC+khMIzNDe67NpmvH
 kWurpU422Eo+G9zBtC20118LZho+o0im6hfMffE7739/yy9Q86IfgO3EfsyvVpQQbh
 irD3dyP0MRY9h8HMP7qK8hd/L7mfg9mtlK1xKm8zUYDC7vagWX+FPXdVNAdI9qW3HL
 PnHZ0DSIbMTUA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [GIT PULL] Allwinner Drivers Changes for 5.12
Date: Tue,  2 Feb 2021 22:36:50 +0100
Message-ID: <161230178517.1902917.510621231358952073.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <91f2980f-266f-41f2-ba10-5a395625498c.lettre@localhost>
References: <91f2980f-266f-41f2-ba10-5a395625498c.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_163701_479837_91FD59C5 
X-CRM114-Status: UNSURE (   9.03  )
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
Message-ID: <20210202213650.doXNMhOtV-A7pwh-8owIrQqL-ctzmv_e6JEyApZz-rI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 18:58:57 +0100, Maxime Ripard wrote:
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

Merged into arm/drivers, thanks!

merge commit: 4fe05d21a9b1e5c5a8ad7380afd7edeae078e00f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
