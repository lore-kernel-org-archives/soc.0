Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAC3C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:43:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251D364F92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251D364F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yupcZNhcUiVslnepm5v3Kkm80pa1byowqhi8EwzkhRM=; b=jMfH7V49gFw7lqkUV1LyuZZOz
	8ULX4VeO0rigNexyJ40Nl7Vq8dQl7oRu3volr2ctrWaY3sz8FcbtNJ6hRsmGpDsBiAabPsFJy6wa7
	mwHfCsPMv9ZbZFJpovXy22SQFS4FADPFBo4ERb550KPTA1Ua9SApX8SdiU81ULXHW6ra+x/1UDJc6
	eWExgwkeM1LgwraWF6DALtW+JOq2mua2R8IsOsq2U1Pl2O1D2E9sHBMwiCNOMq9AZhlPDe3A0NP36
	EePAuVcoeof3aHvMcvrTKyS+9Wcusw494Yso6tp4JlpMdBClRUJifRItqjcxansMxlq8B5x4GTeh1
	martgWhYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73RM-0004fZ-3W; Tue, 02 Feb 2021 21:42:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73RG-0004dl-VD; Tue, 02 Feb 2021 21:42:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C60B264F64;
 Tue,  2 Feb 2021 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612302142;
 bh=tHIskrs77dAlTC67id/8EbLayMPvIv2xvnqtYbicfpw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tbZfQlZCgTNZRdEfxguubzEXJzM3yCC0BkedmGOlEVa5DVARCOwTYELnEcwIxPifB
 Qc8OVpVl4HcsXBE476bpvbzq/kTIQhbOjXTOXLTHBSyQXHdQdni6Wwc116eCWRotlO
 EW6i49hCtqgDfOncRmzAKhYP3ZODeFtKScH8mtcPm0uAqS8/F6XR3EqaOwEwCE08EI
 20P9zIYv050NFfOMi12Ctb6GYyx/dir/ZLmjBhRufjyzLq/1rEvqIbfyVi7wBPjHZl
 R5DEqZKNCZSoNlSi2lCqT5LM48zTzvwzjKeqfNlGeT+dkcEeYoYeFwkTLWfab/MQvC
 eR7d2pRnYKCQw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] defconfig: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 22:42:18 +0100
Message-ID: <161230212660.1903845.9537222226422007061.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
References: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_164223_130452_34C68DDB 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>, Argus Lin <argus.lin@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202214218.gf_kUjVaLMgeqVvjYGyl3JrePFHqlxYyt6ZhFqgQU04@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 11:19:36 +0100, Matthias Brugger wrote:
> Here comes a few updates to the arm64 defconfig. Please have a look.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: 77bad664169a7b5ea954638cf049d063b8b055cd

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
