Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EC2C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FD060F41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63FD060F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+UDCT1iMVXR8YKvNlE4lKRyj3DKvq5mZZTAlGzXFFs=; b=N+UgtacdLyawHO
	BkssEGsdaDk0BJ/bZUmxTbh/oZPeLYUnjEqIDPoS/hO/LvpdScxL6/jQrcqgAprSUMgbTb6wqYPNu
	W3HjgBA2kIpZiyBOH0pVSEpJ+rHIgckzJ15PPUFUOWnCSinu1Z+1L5jp+MQGG4b7NmHA99ptBC62I
	mmZqLK8KjTy17G/+TPXqzg60CwY8Jwoy146QkEQMWDFnPww3DjWL2rH96OpfhweIy9CIxjJ98f82o
	b/JPbvQweJcOUuSaZzVoAPFoBGHBTkqO1pyDR3PzY/JfZ20H/rrcFtMESP2nBgCsXGO8mCc7E4vZo
	QnaBOl6e6ENLFl0NsxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFjwa-000J7a-Ee; Mon, 16 Aug 2021 21:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFjwO-000J73-UG
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:14:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60ACA61053;
 Mon, 16 Aug 2021 21:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148480;
 bh=vFfHS6ri4OrW2M+HU8eNzG+V4pD2HdHaaiuBD7QCIL8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q2bAla3/lYhJoAoyvZ9zZ2quPXnusX/zLcQ0IoqzPwCJ/+4zwn/lqKyU4HFEJ+WYj
 Uc7QZZQaP7qu4FKkzcqf7GAMRPd4XftL6ckPBR+C3JEiwfCGkmLtGk12AvKhkqhFV3
 OHw7UIrmpD/EEVDFbNcIwsEgbqfwDIut8lM1X7UjTOieRIV2GmLmNR9lBpFX7XMC2A
 i0j/6zubnGLODjIBaDsXyx8iyPyN4m6HHRKWEdyrHWPp74O4ZgR2hrOIICdaIF7T32
 nDiXiBzTheun44SIk70cRJ3SGjHz459/4hBp0WIZOZhobGfKQ0EyqyFvdQvujMa2xx
 ETHoneUCXrnGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: configs: Update the nhk8815_defconfig
Date: Mon, 16 Aug 2021 23:14:34 +0200
Message-ID: <162914846686.237742.12685570963154533210.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210807225518.3607126-1-linus.walleij@linaro.org>
References: <20210807225518.3607126-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_141441_032892_F865C1D8 
X-CRM114-Status: UNSURE (   9.07  )
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
Message-ID: <20210816211434.cOCTrFpksIJh3V6m9Mo-hpImYqOlfqMlWPrWx-wYNfo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 8 Aug 2021 00:55:18 +0200, Linus Walleij wrote:
> The platform lost the framebuffer due to a commit solving a
> circular dependency in v5.14-rc1, so add it back in by explicitly
> selecting the framebuffer.
> 
> Also fix up some Kconfig options that got dropped or moved around
> while we're at it.

Applied to arm/fixes, thanks!

[1/1] ARM: configs: Update the nhk8815_defconfig
      commit: 813bacf4109802926d86f2d7c6583c6c0a0fddb5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
