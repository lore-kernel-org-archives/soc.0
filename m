Return-Path: <SRS0=Yq3b=MC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6015BC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27ECB6135D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27ECB6135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjII/Bsw60Aa1cVjH//RbWdRm9G6E9J7A4PspZsTyoU=; b=sRMTDPQ+qw2RMR
	wogF4sPn3ssbRlSmAfeK5lwk8ho9S0AnRPntnXx05rYURXP6Uxbvu2SkMN9AvOutXMLiTIxJEhRuw
	w6yQgfAd8ponTNDOko06b8J9i+8lq0wuPV66sdftCPHs5u9UZbZooTWoU7GbDS/so4Y93YYgSPlbR
	mdFsjQMAwL55qScVbMBxqIxrtccLSTkqa9dAPBDliL9Eh/ZIjy+ypLZgW3rHVmN+U6MgzgvNnWS0z
	tq98CNHrYbZqD9YqnLaFSUXw/Yfkja7oXxq35wKferGN+ris/OCmHHXrKwPFInR6uJpNLL/QWTEY+
	5P6a3XM2e19C+k3eT1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2Gtk-003xm3-HH; Sat, 10 Jul 2021 17:36:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2GtA-003xeq-SG
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Jul 2021 17:35:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 978D661283;
 Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625938540;
 bh=HvOYTSWxLcF9VlsCX/AqAdVAD3GBQoHcRQFRUbkwZPo=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=AfE/3F/JasM4SsxcQYh1cxHJibZcWmWpX/8bZW1Y71QOmAWqPObdh+RCTSodAu5G+
 DmBTApiArDO3PiXHBgVAfN444/Ik1oBT5YbavLuEUUnsWSeq3UgZTxMrzeomuVOR4N
 vMow073qepCar0+AbRMRHmQy6pn7p/krbvyN0le958D2EaiVA3jni6H2SnZ28+hL8P
 KTCfJgcKc3xOcD27MHHlDIi54apZLjB3Qq4fe7KlF6VAnWY7ICXMZD4lHTISID+vfd
 uqZ9IYCUvtXQlchyg8qA+zMoqKcngwWQ1ti2YD7PkVxmHMKbXdYAqk7JX84bV06J2n
 Qflpr67ssEwkQ==
Subject: Re: [GIT PULL 4/4] ARM: Defconfig changes for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-4-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
 <20210709234054.10288-4-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-4-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-defconfig-5.14
X-PR-Tracked-Commit-Id: e6adbcb7e2d71b0e0e0deb6f904783aeb79728be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af4cf6a5689a9ecc21722cb2bb6220dcaee89c6e
Message-ID: <162593854058.16773.7687792762561923860.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:40 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_103540_962551_B3948053 
X-CRM114-Status: UNSURE (   3.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210710173540.LPseMIaJbDbOvqa-KuO2umS3cJgFNK7nLCEoWl01vBw@z>

The pull request you sent on Fri,  9 Jul 2021 16:40:54 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af4cf6a5689a9ecc21722cb2bb6220dcaee89c6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
