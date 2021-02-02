Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D88C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBF264F8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 16:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FBF264F8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lW9wnlsszS+0szoWi5AY3QDVTGTzoYslRR7tOcKEGV8=; b=wzOFxWTudoKxZA8ulqOt0MJIX
	2huqRiiaHKuaLX+bI+3tJBTVTp7uZsbAyZavG7fiGEbes07A9ifLQiCxg7IgBxLZZpqzrPjvrH5hN
	G5ZW0EG0rAAAMFcLqHgWcPLkYluYiAly8E8krzoWk2QkosO1zxL44b9UT7F9Glve6KctRv0PV4+cs
	Zje9xeNUEFeF9GordDTnDsUx0rEt49TFxZEGJ6F37c33uI7eRmxWhCgRPFtVRAaYctZhG2duJly77
	tTxjVBSXHMIj773RqqplKQs6JqIaw++lw2RIV06Fq4DEzVuiwCpTNerbog2ZHyS8jMTQc6+WbgdCn
	/R2WzJWSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6yqU-0008Mi-MU; Tue, 02 Feb 2021 16:48:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6yqR-0008Ls-J1
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 16:48:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A3AE64F7B;
 Tue,  2 Feb 2021 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612284483;
 bh=v1NnVSi+Hlclnm9HV7X6h64hYRp8PCCjPAjlT4F8aOc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AUJdeI0JLDhQlnHpGSgRJuu0LdQacUZB5sD9HykPjOZJSAtqZcEsHZHiesFdwbFJY
 7uGwQpbdptHRR8rJh4Lun8cBawAuGek/nja5coiq0cwQN/6Lv2lniNFM66Bx8PE6k0
 8OBsAZH1Tymhi7K5V8CXpTzdrNQT/OoKPynfnTcNQSbkk9ELWOe8CwA7UKkY4Sn53A
 I3ZXIe1W64XGVbmb3Ju5e7tFqW4l9OB7TFH37QGoWztqPVYD4u0mf9tG22icYsQhT2
 ggsLOj2m+HawqGfBFUyO4F3GdSb6Ax8hRNWET1NoUTzoy6+KelMwb9ROl7bYfAa80z
 L+5O1qof6i/yg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Subject: Re: [GIT PULL] i.MX fixes for 5.11, round 3
Date: Tue,  2 Feb 2021 17:47:52 +0100
Message-ID: <161228438432.1848830.13359081644541092544.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202071441.GP907@dragon>
References: <20210202071441.GP907@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_114803_737365_29A45FD2 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202164752.aynE0LBwkR4mC_xfPSJxTiDxJE6IvqIpkOqO04UrGR0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 2 Feb 2021 15:14:42 +0800, Shawn Guo wrote:
> The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:
> 
>   firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-3
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 422d7e3727d8f7b269a7dd2eafc279fd5dddb13e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
