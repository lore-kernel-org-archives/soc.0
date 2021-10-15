Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66583C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 07:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381AE6108B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 07:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 381AE6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LlH0+Bq9NbpW1IL9sT6ntViTTR1n1iVxcVZgrCRw+8I=; b=JiB7RN3GG2uTx+
	bSRD9eIdga+aLXXgu+qkQphfSRfkaUrYhfSGlv5jlvhUP+278Skdc4eRQ2g3riQTOcoCQXeBbS4zI
	VZN95MxqgIXj2o30I2JJhH3WC0L065J/w+fNSa/rVmxGDEHuMqVaAoGBif27fMLtLX/eRso6Eg+7Z
	FrK9ec4PB/4NzmUhlY8UFrt14H6MAVpOBNYGqCBEi+/ozkohkpKk/qiGpZ7uzSj7mqjIqtzyVe1Xd
	9MEIHOV+FJhweLAxdBZjr4Yi3Wf+EhutpHkhAaTtdhrUELyYyve8kDBz0ee2uTNftte00Fh5j35oQ
	VEsY7XM+c6ipKoi0vbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbHCi-005dhZ-0R; Fri, 15 Oct 2021 07:00:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbHCe-005dh5-TD
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 07:00:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCF656108B;
 Fri, 15 Oct 2021 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634281228;
 bh=ZdbIWoWbV0Jf2S8p/rqDHwmcj+pmcu4J/c3RWMASNtc=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=iihmB383d77TE9dqJ4ss8yuPtz1hRt8lzOGdn5tClAYoViMOpLbX8KDadmx2njxMl
 6UlpcE4oUXz8Fwl7pdduHzGkaY3iwOZBCxP6tjEI/5d2opS0+SnNlZXOi1OpPRlahW
 S205YWA+P5PAPBourbOeDmDxGTSQ7EiRXSum/uY4SLz964zcFBIK5eZuDdWZHXQkvs
 v27EJcUsRlEPYcwPiMTE8nVX/C1eXdvTao2tju7WnkYgLI9yycaQx1C6lyahDm9abj
 juXxjKSJOvHW4UB1dloae4D4d/p2fXMRm3Ci/Xr4SH9q04c6Am+w6uuSj143N8W4AS
 AXt2scKX94O8w==
Date: Fri, 15 Oct 2021 15:00:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15, round 3
Message-ID: <20211015070017.GI22881@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_000028_984627_19342DAE 
X-CRM114-Status: UNSURE (   6.06  )
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
Message-ID: <20211015070022.N186zPtHu3Uz-0GGASN865TUq6E-9TUyRHPvFmzIXwI@z>

The following changes since commit 3518441dda666696707afe933586151c0fb29db0:

  arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio (2021-10-05 14:26:21 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-3

for you to fetch changes up to a1467faa10414ab3d91be7ef6d2b11272ec00e95:

  ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15, round 3:

- Add platform device for i.MX System Reset Controller (SRC) to fix
  a regression caused by fw_devlink change.

----------------------------------------------------------------
Philipp Zabel (1):
      ARM: imx: register reset controller from a platform driver

 arch/arm/mach-imx/src.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
