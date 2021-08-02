Return-Path: <SRS0=DM4H=MZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F77C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E55860232
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E55860232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20Gjj61ZfDU4WirgAQ40gnryimL2hdt9RuwhJxdGI8M=; b=hKvrIivZqgZqAi
	22hu5vaZAwCL7LKo7I9ppmjy1NNVp1nvwRKec7gIF6kAGu1S5rDT8kwUOfUn1QFl+7Kvhql8KBuo7
	UClk7nmiWENdnGvQUT8WfXBN5CVdEHFD4GzHhT0aQhAKEGazrEqCDouIbQj6KtdbMmp/KLmRBMToT
	ALVL6vDjKdl/LNw7eCVHFtexcQ5/Fm2yLpF8ClxGmHnxNcCjBMtqqoxuxIo8LDkSln0LelWv8xyjF
	EL/5WFxQaCgAmx5vH31MorLJ+ys1vabnQGPHvQuYu3D9Nl8limPou37rPidzGyuChNOoD74kSaH+W
	Nub3Psd28JWEBkN8PgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY5J-00GOT1-Ek; Mon, 02 Aug 2021 13:34:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY52-00GOMM-HS
 for linux-arm-kernel@lists.infradead.org; Mon, 02 Aug 2021 13:34:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CE1960FC4;
 Mon,  2 Aug 2021 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911248;
 bh=EeMU1k7JK0lGUWjAt7YcQieL8boQC4w/IvfTZ+BdQW0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HCp8N68W9YRlV8ZnmecG/aC3Ik7T1HvvIPbEqeMH6urgZuwnIE4bOCn1n2NAVf9VJ
 9vPos0y98C5bBIAd74aAB9Qv/Z4wwNGBdqFl4wV7vDXkOax+GjFdzZuOtG9aAG41nN
 svsKRXDq7lYQiVZhZbx3J7sAEPq5jeD1RRpqHy7PtUNXfffodzWM1KDrFnAUK7LKAj
 LA4fFts4ubfWoL90WUUKsMQV5cS4C6BiVEAX+CApB6hX2UjTn5hegZ45s+EpJbKo5Q
 DQ29XkIGph2LeUKnytMRue/xSj0W9cRpGKZfgEN4cIJfsRQkqg1zC1k6yzsmcVv2ul
 jvUinUJWtV+xA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] Renesas DT binding updates for v5.15
Date: Mon,  2 Aug 2021 15:34:00 +0200
Message-ID: <162791122501.1140356.6236184546400456466.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1627650706.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
 <cover.1627650706.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063408_627674_237CAAD4 
X-CRM114-Status: UNSURE (   6.99  )
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
Message-ID: <20210802133400.sM_NTyu5EJ0kec_fiGwuqWthK1B_Z6KAGZIos022Q9w@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:18:56 +0200, Geert Uytterhoeven wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.15-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c4994975132eb2488ad1259c273812ae38f5fccd

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
