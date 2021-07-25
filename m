Return-Path: <SRS0=5RC6=MR=lists.freedesktop.org=dri-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F8DC4338F
	for <dri-devel@archiver.kernel.org>; Sun, 25 Jul 2021 12:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F6D60E09
	for <dri-devel@archiver.kernel.org>; Sun, 25 Jul 2021 12:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9F6D60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA976E233;
	Sun, 25 Jul 2021 12:04:29 +0000 (UTC)
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4286E233
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 12:04:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 779d7b10-ed40-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 12:04:30 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B24D194B1A;
 Sun, 25 Jul 2021 14:04:43 +0200 (CEST)
Date: Sun, 25 Jul 2021 14:04:22 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <YP1TRtiWkJDG76Fr@ravnborg.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714045349.10963-2-o.rempel@pengutronix.de>
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
Message-ID: <20210725120422.lcQ-WIzWk1K7A_d7WUNDWDAwKcw1CIVJswbCvDt825k@z>

Hi Oleksij,

On Wed, Jul 14, 2021 at 06:53:46AM +0200, Oleksij Rempel wrote:
> Add Logictechno and Multi-Inno panels:
> - Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
> - Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
> - Multi-Inno Technology Co.,Ltd MI1010AIT-1CP 10.1" 1280x800 LVDS IPS Cap Touch Mod.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Added to drm-misc-next with Rob's ack.

	Sam
