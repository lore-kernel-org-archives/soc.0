Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B528C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3074360ED5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 20:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3074360ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxJtg5iIqMVFWlPR3Infqgr5EoSlal2N7MEoAQIDZgY=; b=KlUzNt9IWZhXhb
	KLxvkqfeKdm+5PDbdb8ynWU/S6kp49NtzdwcfENhF8Jjo26BBQkjoE+14GCaRKu4xxjhgjPz3ROE3
	YDUdo5+RNaOsys7pQFpHHjMmiy64xVsZptaVTqdUIj7vRSo5ldJp0wW4VvIXYMCp9Jem5rWoSQN7W
	gfmEDpiQ9Fx0MfD4U0aNGVN5pc+KJ9eW70tg23hYIu3wXURVisEg2/jtXneEZ4lA+caNdYWtYTHj/
	4RXPSS+CP8wotDSzzKpyo4uY777lRmywlyiUsEMBVKnc+a+mioTXcvHkxreZ9SatthWhtnsAr2bEP
	FDRkinbYp7O+aHz1yciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEHdo-00BEsU-EE; Thu, 12 Aug 2021 20:49:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEHYo-00BCcs-Px
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 20:44:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01923610EA;
 Thu, 12 Aug 2021 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801058;
 bh=9WwxREJRR4U0+2CT6CqVEIrRLcjmcYZaGwYDsR3s8pY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aIlCSO4z2Poa0fj9tw+WeDbIPQCoAzP1kHWVj9dEXBvl9ugo3pLxtHeA0NeoKKxnZ
 g8Y/qtDXQ85YIeKft3TUsdLsSNJirztqQc6mOAl373pA0gBxlGfO61XSZaqmtqNfWm
 1YH3+RR2KY4X9D+tJn0/zDjPldrCT0X3yN5Nv7nJgoFdU9BMNKhJja3iWdvwbGkQ3u
 K+5NoRdBJh9lxnpMkB3Xhe8/hcyvEvzgcx3UPRG+kR0OMmXx8FYreoGEBzBQ6T/HTZ
 KvqlltJ3It7Wno46eI4LnDPv5gknrUlarOuwS3jSkazKjcs4Bgq26+ZkRalJWKm8Bw
 3YoDeTJBuWwBA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 "olof@lixom.net" <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, "arm@kernel.org" <arm@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.15
Date: Thu, 12 Aug 2021 22:44:03 +0200
Message-ID: <162880092637.1372486.15700318335948204747.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
References: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_134418_943984_62410E93 
X-CRM114-Status: UNSURE (   7.46  )
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
Message-ID: <20210812204403.iwYgH83aku7OXJrJ8bkWeq3BG5cCDwZDWkuM26HY-Us@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 23:38:07 +0000, Santosh Shilimkar wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 866e1691ed5beee933c0f8c9268963c33377ede6

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
