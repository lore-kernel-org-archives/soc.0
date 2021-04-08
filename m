Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72889C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:26:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3F861103
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3F861103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P3yTovmYAZXccgp2PlCEjgVCQK7RbKq/T0CgWYHfo/A=; b=Pjazu2OmrD/iuv8lEgUTiB4tK
	KGxi9yFy4kImn/fLc0qUP7wr5AJy80eCosQRTwn+Sq44+G6nkQMBDgENzl9LBmJS1gALQQbFp3UVp
	zjuuQCfvUYBzFV4nBcy3pvv/qiyIOWoD8A+RqMMT/VsYiStH4RS7C264vq6mUlTyd9kmsWTVWf7lK
	KLaP238FPk0icmh6HM24zu+r+iQNPYf4mu4FvRfs/vOYPD2qYrUaivVL52nvvKjoppInt/wZ/obqP
	tiPipbxPm8sh9qjcOQC0zaAk335T+D/wWcCRz2ZAJpNrJ4GHGFLkNaMAGy/NW6mJxT02ySWeYmS2/
	CgxY2OCyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWWg-008NQC-Fx; Thu, 08 Apr 2021 15:24:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWT-008NNT-Kg
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:24:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 653F961139;
 Thu,  8 Apr 2021 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895484;
 bh=JELiv0rbuI7a99pdo3R6EcIdli/kt8XWBiKOWNVrjkY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oQlnHLA+l069qUCLIxgLHzR/nLC2aQfQMaPlE/O40DGLk8GwS0B0MRXkMEPEpfuaO
 pWw9a/DvebIapLJ/7CH/uzLg1kQbt4jbqR9dW9F/hDxZwiMf7UoziVweMz2P/K7k/I
 gI2N2NA7cfXsYcSSGdG7Sfgi1CnewakXBAZQZXyXfS8EdTiimpuRUAx2ory8ytkU/9
 oOwjvh89yNT3RvJyaoldFFt2VTRvz5I5JMLv5ELfgC2Wd3pEZSxa9639cgWxKaok0N
 cH4+fboigtgHdmU9TDejaVS8cgMEBQxfbv2JLjXs6gcxvFx38Ol6qTn+Nu1PB2hBe6
 WsoTauDPnEZzA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, arm-soc <arm@kernel.org>,
 arm-soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.13 (take two)
Date: Thu,  8 Apr 2021 17:24:20 +0200
Message-ID: <161789462010.1629934.8245364544434971043.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1617359678.git.geert+renesas@glider.be>
References: <cover.1617359678.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162446_059897_C094BC6F 
X-CRM114-Status: UNSURE (   7.62  )
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
Message-ID: <20210408152420.13hZDdey-mc2PxtOoDAAZISpdq3syKjD8jK2u5npqs4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 2 Apr 2021 12:37:15 +0200, Geert Uytterhoeven wrote:
> 	Hi arm-soc folks,
> 
> The following changes since commit c8aebc1346522d3569690867ce3996642ad52e01:
> 
>   arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-16 09:58:00 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

There were a couple of added warnings from 'make dtbs_check W=1':

renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports: 'port@0' is a required property
renesas/r8a779a0-falcon.dt.yaml: thermal-zones: 'sensor-thermal1', 'sensor-thermal2', 'sensor-thermal3', 'sensor-thermal4', 'sensor-thermal5' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
renesas/r8a779a0-falcon.dt.yaml: timer@e61e0000: compatible:0: 'renesas,tmu-r8a779a0' is not one of ['renesas,tmu-r8a7740', 'renesas,tmu-r8a774a1', 'renesas,tmu-r8a774b1', 'renesas,tmu-r8a774c0', 'renesas,tmu-r8a774e1', 'renesas,tmu-r8a7778', 'renesas,tmu-r8a7779', 'renesas,tmu-r8a7795', 'renesas,tmu-r8a7796', 'renesas,tmu-r8a77961', 'renesas,tmu-r8a77965', 'renesas,tmu-r8a77970', 'renesas,tmu-r8a77980', 'renesas,tmu-r8a77990', 'renesas,tmu-r8a77995']

merge commit: 85af259bcce7a4d6936da72fd84757502a2c5b5e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
