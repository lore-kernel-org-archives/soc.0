Return-Path: <SRS0=7wMw=JG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88610C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Apr 2021 19:56:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23F34610F9
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Apr 2021 19:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23F34610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NN+34Msuh63cpqH5HsJpPJM3xqKKTaaFb/ekwd+BbG4=; b=az5Ii4I98FSUW8X4RaPVnbDrS
	xLCgT+ZL9h5OBHlaQ7giiuENizoKVOMvbn7TY8hmTYhuYulLr6IP6Dpbn3v3bkGno0QWQ3aOR/bID
	vIEjegW9xFQRAlFcwCERjsSetVYn9OHZd7YsE0qg6WyjnSBKnqzb19I/36HaX2U/NvPHTBp1OEXnr
	VhR7kUeyJknUnw7KVoUqDUXTSa3++7Rlx4tQuH2d8npd5jPbbUmwh8eFJvq0DiF8ioADKFjflspds
	wmdH3DsHp1jAlVsMqZOhZnh65/uLq+ijkWRaWWsqsVBrh8UCg6oH+vwKdQ91HkJpCS8zj3HECC3Xe
	Pw3MSzBrg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUxEB-001S1O-3j; Fri, 09 Apr 2021 19:55:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxDf-001Rxg-DG; Fri, 09 Apr 2021 19:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:List-Id:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=6Sh7BT7H/1kqw0LjPMNVqKo2HmkFz0rqHz/HzAQKxyk=; b=JcMphgFK3oRU2BodDLxhehsQXO
 LC4gTz12SIGzIdJk9BevdeF2FAqNK9Gz3kOkFO6mqT/0MGlq3TPMt+uK28M8Y63J1tMkQGmQlDeeJ
 E52/LyHFwZx2BF49lpLmejisxc61H66JGnr6qRM9Pc0RRFt2VU3pCvda77pCDp47ipMd7V0Icp4s6
 7dS303qKdpI2cFu00JYsRnxYaG5B2DlzS15HaGFGtPu/AX0O5ZOh8DrmcwjsdS74Rck7uZaImmIRE
 zXlgCioB69GOTphRPKndnG6Et8qPsjBjyDy71XPsQwKzBm0mvKf9fMhDzpuJLQU7wvYtKVkXNAZrl
 GII1/Vkg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUxDd-004m0b-48; Fri, 09 Apr 2021 19:55:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86DE161186;
 Fri,  9 Apr 2021 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617998104;
 bh=pDnrJcgtP6+wy/hGLUiAByKSmbuPue4kVYXSXIcpLHE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V350quqbWUUsbsrh5Yv6DnUxUOsPsaBjPn6nD/QcIO2LhP7hZ8sDw1hp3cACCDTdp
 XDtvFFYnwtp6gfgt5gT+7CtAP1lND29oNRTfrP8VJJBBfkLWlGmPMhq/HroZQH54+X
 DQjg0vARZ2vRF8m8cSPIgf/DUVoTI1q+yfkhBcNSM2GkgZ8SVhMU3r3g3/O1rmQCqs
 tikY3hnrJb6zLbKkeIzvWqb61yMXjpaPTCeFiWSAFpG/M6LtAOc9NJOyUGQ6luZYfm
 Hvlcy6LxBueud14cVPuwDSZtjkiEJ+kStIoGuSyF+X3BlgBRfk2b0+/460wHhFzUY5
 wZEzbym6tmtaw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic: updates for v5.13 (round 2)
Date: Fri,  9 Apr 2021 21:54:54 +0200
Message-ID: <161799808702.1862218.12904940080958587014.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7htuofgwaz.fsf@baylibre.com>
References: <7htuofgwaz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_125505_206604_A6872731 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210409195454.WC0rbH55x6djhKZQydLay1nYKkOA7p02VL0hzzHqeKU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 09 Apr 2021 11:14:12 -0700, Kevin Hilman wrote:
> Arnd, Olof,
> 
> A 2nd round of DT changes for Amlogic SoC families.
> 
> I'm now aware of the new DT warnings added in the first round and will
> work to get those cleaned up next.
> 
> Kevin
> 
> [...]

Merged into arm/dt, thanks!

merge commit: db7a033f2b1f54c46244efe54687fe8f4b9b7c21

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
