Return-Path: <SRS0=HP3x=LN=lists.freedesktop.org=dri-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0018C2B9F4
	for <dri-devel@archiver.kernel.org>; Sat, 19 Jun 2021 20:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A14601FE
	for <dri-devel@archiver.kernel.org>; Sat, 19 Jun 2021 20:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A14601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=dri-devel-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984E66E043;
	Sat, 19 Jun 2021 20:32:23 +0000 (UTC)
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AD86E043
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 20:32:21 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3c7cff3f-d13b-11eb-960d-0050568c148b;
 Sat, 19 Jun 2021 20:16:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6324C194B39;
 Sat, 19 Jun 2021 22:16:19 +0200 (CEST)
Date: Sat, 19 Jun 2021 22:16:13 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 0/4] Mainline imx6 based SKOV boards
Message-ID: <20210619201613.GA533354@ravnborg.org>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121050.18715-1-o.rempel@pengutronix.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-ID: <20210619201613.cY27M1oaoZjF8lR2AUOtM0ASz7WopA6mBgikPiOWEIw@z>

Hi Oleksij

On Wed, Jun 09, 2021 at 02:10:46PM +0200, Oleksij Rempel wrote:
> Mainline imx6 based DTs for SKOV A/S boards
> 
> Oleksij Rempel (3):
>   dt-bindings: display: simple: add some Logic Technologies and
>     Multi-Inno panels
>   dt-bindings: vendor-prefixes: Add an entry for SKOV A/S
>   dt-bindings: arm: fsl: add SKOV imx6q and imx6dl based boards
> 
> Sam Ravnborg (1):
>   ARM: dts: add SKOV imx6q and imx6dl based boards

Thanks for taking care of these!

	Sam
