Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5A7C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:47:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B23611C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B23611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vSrKvbSI2UYwIg8pe126MiI4v7DYjPyU+hjorJZIzM=; b=LWvuPntu36ioIiunS66eroWP03
	iLscPoW0gAzZHKnADsQzGUmbOd3FRF+JfeNs5EkUyNIqbesB78CkM3o5aaY7OA+vco/Gy7mYb7Vf4
	xXiL1pvP1dQcNi9I/dqeGDdfuIsMXLJKu8vHjdeaI130VEzhKxXWEMtlnCfMRSc5VXJGGDVU55k6o
	lpC+2qm0ud/QEqKxB32Vde5hWsfso9BjDLcDLbqQES1lqA1gA9MR8s1YNicn7lzD0f/TXqlHC9Kqq
	evT5fwnPaohm7Bo1sfDoxi/P4DqY0T7pd/50W9IyW5xy0BrexAASH9uFdD8SGJQkBL41L5vH5KfOQ
	Ye57w+cA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb7BA-008Phw-5Q; Mon, 26 Apr 2021 19:46:00 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb7A0-008PUp-4E
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3P8dsaF9nDxoAl+XeSllKFaEvUX/Rft7TSY56lEmkoY=; b=AOqEjpFtAfY6tC+07mvmqAUZ63
 gSWo1wyYA7xPqY57TaeeBxJbHaLhMbLS3ycfbbh7qay/Ehfa0SBmAj8L3vC236GpCfM3VFgVJjw7q
 5V46mA8rCzzkjdQ6+Zn17uKExIkY18IH+hVQr+mAXqy7NpGmjq/sWGqE8pRkEeLeVkWjvreG9orxD
 d7uhmcl2ngm8xDc4NiOzHIDiePsWpRUHbd5oDocp9v8KjL4knjjX2YhgmZfv2HbcS9z7s80r/SJS3
 ZWcD1Po5F4sNqNY/bk/Ef7PMTJPB2rI03hJYOceDerT/lDlm3bgkldOv0F9Dr6lI9tA8TwjfeW1IB
 3pK/6KVw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb77q-00G9Qr-4G
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:42:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id C53A960FDA;
 Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619466152;
 bh=FW6NQhAUMSDDa+whpicVU1qrC7PbgWBfJZLN0JZ2+yU=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=HUwNs9uysYdVOgSFJVkNyxM5Tr1J4rNhm2002WBQXsCg3Eck83dr/Lpj7AeIZSLy/
 KVydt8NivSOWbJImOHFHM3AsLoM9BC74yLnyi2kzssmpR+K60WliRFbwGfVgDeEF91
 j19C5EZm2tORO/ZypCjKH27vum/9yPcuwZYamM3zHvaqygRiu0/Lj7RGpqasQTQ46A
 DlZIJxG8vS9CH3hFKSFSI0voe3IkivpOPXKkzu4Uq1hmRLgcp1flxKVgDjh5TsfYs6
 VDKkw/tw+ShnTFgXpcSHbpe4lt0Ts35XN5ksJDa6YsFxZnhvjVhhWdZVW9CukS7Rvl
 1XUKgcO+IavUA==
Subject: Re: [GIT PULL 5/6] ARM: platform support for Nuvoton WPCM450
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-newsoc-5.13
X-PR-Tracked-Commit-Id: 39b95079f68cf17888a4cee93ad3c4acc3854b38
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b0fbc540c2fc34e55828ef9918cc61528071a01
Message-ID: <161946615276.4821.7651727399452852128.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124234_232699_F1E3FDFA 
X-CRM114-Status: UNSURE (   4.55  )
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
Message-ID: <20210426194232.0Hw81dC7fezp7gxQCOjsywhnus-65cFkHW083tBZdwU@z>

The pull request you sent on Mon, 26 Apr 2021 18:00:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b0fbc540c2fc34e55828ef9918cc61528071a01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
