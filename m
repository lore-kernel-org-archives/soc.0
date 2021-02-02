Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96799C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ECEC64F50
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ECEC64F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wg4P9aoFYwffyw1spB+fYAKq+gwotqWvhf6LIqQWx44=; b=gH/OhVhIgXPChBp8eW8CbgYvn
	+d1h8eX0D0HgX7IUeivDYE2HNR8QcZQG27HwBta9YU371LcWXSTdXCVME/fQI9Ssnic/51zFCTVE1
	mwE5zYfyyiUzwIJeuOwlWZix8+gPL7IxsJRj0pXClHl9BScO2ca2VGt3SyShuvvKH2HfwsKz6fBEe
	mxsGxoZXL+Ieo6LCCS2JJn4cWTKh/f2P7PuB63MfEjIrmj/plsXa9i9m9xe7HfKrBK+VAfu0vWUpt
	x0i1sO92VYkMOk6Pp/tzXaFZhY0op3O+M1QYksxPz6BUIknZMYJ+4mTzfUODZ3Q2/5le69ENe9ba0
	kzK60ypnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zC9-00035q-Ne; Tue, 02 Feb 2021 17:10:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zC6-00034v-Sk
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01B3564E40;
 Tue,  2 Feb 2021 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285826;
 bh=BRfF1uAnkdalZf16RbEhOeE4QAu6Gy2jpB0YUCfazSM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=conwv+FoWgnoAHZHTFSe4NJDs2mqC1kyD6VaA6TVbZxNDLnklXyh8NIxjTI6KB6UK
 kSavTphCOWIpt7iIg3lf7GNcv9xo+9SVxp4YNEa3lj2ecrpHWMjNQlHnbN+3RqlLsK
 P43WJG2LcY7aH1pxt/afVBm0+2sCHBOwP643RW/yfMcAOSnhSd3BTk4C48hcwuJ5av
 yPS1oBAmdyBGEr5gUWr8p/foQL/vGnZSZ4WVIISFBylo3yP+bVMOIuJ0TSGTW89xwY
 Hd0/RWSIWOE9ZAQWprIWOJTFbxk3yxqgLlDa64q0xle8jfDs8DoNo+JgU85OAdtQFa
 m7er6OJ108BLw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 4/6] Broadcom devicetree-arm64 changes for 5.12
Date: Tue,  2 Feb 2021 18:10:08 +0100
Message-ID: <161228552221.1852435.14632001983840621070.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-4-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-4-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121027_027601_654B3B74 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 khilman@kernel.org, Scott Branden <scott.branden@broadcom.com>, olof@lixom.net,
 Ray Jui <ray.jui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171008.uE63nzVOonFzO5kGcwUVn5MhBmNZ7WQWpx86rBVGcp0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:18 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 528587ea03b1db948bd3a1b0ecdf42a0b92f0fe7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
