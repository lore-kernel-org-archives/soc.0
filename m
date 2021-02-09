Return-Path: <SRS0=fMZx=HL=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC587C433DB
	for <linux-rockchip@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86FF664E88
	for <linux-rockchip@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86FF664E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nj56Tw592dKsz4AuIvUL7o3rDikubZXf0o+O6nVGxkg=; b=gqbUO8SMIhTumnwXhpX8xscJc
	XSYYwPcaz1gW6c6pqJhoUDVpiClHamor3H2VJNKpM7UNPtm+fDrT7Am0AlCoqLByRmo6ykO+7cY7U
	L9pHWIMQjyMaJZOapO1YagtErwlQwSHGnJW37nX4K1cUTGx92zY5kH3wDoZDpnwQOYZ1vG1ztOOd2
	KPhEAtPfEw1Cm/4p+arqFDuyifQXZrlQJG9N5fij5BSTDwSLAiV154iXE1HpPOMauTpRzzP288WGU
	/tC+BJjPe/JoXgHpSQYkHnJzrYZXd3Fc2Mf3q78M2iv1HJkNYlFKZFtcYyZkMsRS6BiFpIDXKSVxd
	TRPLhequA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Uic-0005Gf-M2; Tue, 09 Feb 2021 15:14:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9UiO-0005Ck-4d; Tue, 09 Feb 2021 15:14:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1403C64EC4;
 Tue,  9 Feb 2021 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612883647;
 bh=v4TB7BWrAV44HCkJk2zigmW3d76b60s+c6sWD0flSm8=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=TLu7sC6qDInGWkejHXuWBxwTGvTVtr/KYR6lksYxgmt3WUS2Op4q1OQsqXLDKg6GX
 Cb0WiLRdZ4qmM5nc8yZe95iEgTD2+Lu44P4WrOQR/eHu3yWew93J9Zh3VrlqMNFRlY
 NVpenZFvP7CCM0eDPopoyyhJFyo4whlbsEUmbMza4YrhvwlVwlbRUGio1+iTzMqAxD
 jrFLtMJHBcy/5X7/Lh3TozHPdomIL4csFXf1MPj/a4ZiAvK53SjRhN5fCPws1jCYoL
 uLQDo8t1C2zfhvLu90ede6Hf/plmdjN3cFoxlMvKaepGpfw0CVj156jjjC9OIoJyWL
 deEJD7O5xMtWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 5.12
Date: Tue,  9 Feb 2021 16:13:53 +0100
Message-ID: <161288360601.2910447.1012319694875151191.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <4622596.31r3eYUQgx@phil>
References: <4622596.31r3eYUQgx@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_101408_310841_AEDDB1DB 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209151353.athTaZ1Zi3EOXnAnz46IYmX5CTfV_-_wrlS72ipuHUo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 06 Feb 2021 01:01:56 +0100, Heiko Stuebner wrote:
> please find below and in the next mails Rockchip changes
> targetted at 5.12
> 
> Please pull
> Thanks
> Heiko
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 7b9f5793e1f279527e9f155a011e01cd57bccaef

       Arnd

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
