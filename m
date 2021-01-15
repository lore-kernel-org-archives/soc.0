Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32074C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3F720691
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3F720691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EF6zxLS8OB4QVLTghcAPXvW5v7R0g0inrBGvsXkRbm8=; b=RKDZkUCRuFNRKEbgLslz4e6aJ
	hwbBSUr4+w/AtgbQv8j/MgS05hsTtiNNkqg32eFBOgAisX1Bs4Gt6rIf+y0xfRvtuN14lq2ed3y/U
	rB2U03I5/PpBnYrXCfrj86OGEkUS8qhSl4DFIWjmNblqzk5GCWDKF3iketc0IYRR+55U2SEk4k6WV
	7GwXC95UfSAkSLuGqLnGJjzFBa+A/A9LA1L/VYSPuE7zMGqjPfbsUZlSUTvWgePh/NYfUG7HULsiT
	oqdpqe875t5mr5sDaGyESoAo3UQjyatYHE+cQamUjRqwCzfnnhGQF1gOMyc0CPjh3r0gQzIxw85tk
	C2LsidU1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Sqs-0005ft-Ko; Fri, 15 Jan 2021 17:25:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SqA-0005Ra-5g
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:24:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EC2423603;
 Fri, 15 Jan 2021 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731488;
 bh=KZseVbo9RoGphRIP1u02wuJ+X2mAvguu5YPOXFM5qoA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fxNaUlV1Xo/14Yl+Dg1UeNXvDtJA7JIM1lsFtvBiyq54qrlZrAcJ4MgHgn+EDmujj
 cxaSqnKnzACMqDruyZP7slQ7chaADhPci2/zvaygI5CWTvoVlQE7lROll/c3DNxsol
 F1z+pI7Hjplab0HIyky9dBtLHvL01KVI1Pde0jAwrhfbY1SCcZXEHod4rpHE65CvmX
 AgjJkiaVKBcQC7XIgaICRj5fa3mbkDyk2yZ23iioMUhno+Hwjfmx7cB4IOV/hVkTDM
 IDQJmTAojEAofh4HcHXAj71Bq1DzlWne9pJXx3367FPHL5ULXtSz7dxR54B8cseiJ8
 LOpgQCqQTtJwA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL 2/2] Renesas DT binding updates for v5.12
Date: Fri, 15 Jan 2021 18:24:38 +0100
Message-ID: <161073140443.707311.7075669932973488887.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115094610.2334058-3-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be>
 <20210115094610.2334058-3-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122450_391797_F1C480D6 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172438.A2aMo07RcjVNtXhwdAThEym7uiq8NaoyScmiUadbzzI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Jan 2021 10:46:10 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.12-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 7a367cc8d61e2542b0614cc7c8257a08a694c4e6

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
