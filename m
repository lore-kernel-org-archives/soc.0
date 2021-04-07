Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA1DC43461
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 14:34:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF53F610F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 14:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF53F610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D7s0PmHkmGN/5wsrlj/UG9UEbWabFhB+YFA8Go+aKZI=; b=FX7ngsDH+W0da5awfMn1f+hej
	06E1NsX3ynGsg/FewH+Gx98zr5RUOQ7YnjLMrg852VpFTgwEx21DHL9NbxMkwCN4BZQQE5VEckciI
	tNSZfxfMKge2y1g2qfGMfDu1LGFkSeKzCNjhp1cm+2qUlONFAy+JCjsjY0jiJV4joiWW9QmbYhZ1q
	9bdo+W5iqTYkCRsl1UX60r5WW6OvWpM7BZ2gTAdxtxRh7fNUUH3ZPHMRwpL0E1K6p+deKWvQLlPCY
	eetD+2Wp7pRdwHIBzrL5OvLJXgdG6jHMqSo8ky0uG2HICl7Zh4cNyPjMqxRzdsUbRa4Nt6Ka8W3BA
	DY7Lf6JmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9EC-0059mL-1a; Wed, 07 Apr 2021 14:32:21 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9E5-0059kK-Ri
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 14:32:15 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MeTsQ-1m27423vym-00aRxY for <linux-arm-kernel@lists.infradead.org>; Wed,
 07 Apr 2021 16:32:03 +0200
Received: by mail-oi1-f178.google.com with SMTP id v25so18948447oic.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 07 Apr 2021 07:32:02 -0700 (PDT)
X-Gm-Message-State: AOAM531QPHgOgC/6QTBAqm9V4PgCvSyineXy/PnGk4zx0KpD2uK9aE+3
 v+Bs6xUWg8oMtAd8VGvziuXFK1e9IQ/kzd+o9hs=
X-Google-Smtp-Source: ABdhPJz3rOug/myucPiyn2F6CpgsSegz+/pHmK8XszIjmYisNeCOrVVePZdEIr67xXu2+oU6AX0eXAqf1anrPWj7D+o=
X-Received: by 2002:aca:5945:: with SMTP id n66mr2419512oib.11.1617805921378; 
 Wed, 07 Apr 2021 07:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
In-Reply-To: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 16:31:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
Message-ID: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, 
 "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
 Zhangyi ac <zhangyi.ac@huawei.com>, 
 "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
 Tangkunshan <tangkunshan@huawei.com>, 
 Daode Huang <huangdaode@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 John Garry <john.garry@huawei.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Provags-ID: V03:K1:GGgN0/gIixQXyZk8a+TIZGmhr/JD+cGZq8/zq//7gp8aZUgJ/TI
 9S6tJORzxVKMQ/SrzMe4K8vsvyIG2rWHKcVxvmFwpgFOnOFQYKwdQTr70HK31EuQ87aW4jD
 beBP4FComjWG0/+D7dTWik+3eZViowVEUDeZGJi4vFsPFjNSnVZIwN+DhmjJuW3OFK7NFIC
 AI0WV+JdvrOEGsNfhpxXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kRYNhxsNgqs=:pVx441QW2Z2Kxgoj0FOehX
 T1SVyzkg+pVlbLISU7bcLuS/jdIG7FzBGho69UT0FjxAUZhIr+Zp45A7C39wMIOvObwaKvT/p
 GMezjDhFlb76iBgplr83XCH4fMTgSKFmt4YbMCXLQJ/Ix9cH4WL8VovUji/ycY8KsHv0Nzszt
 gnL8dgBHIyzc5QSTqERUPqr7xNscmns7aTfwu+rrj2ddV3cWYVL9OI27XIotP/mvkz+2PPYAT
 iO935p2drMBxsMuAfUSadc2UvoPtm9IkOPKKDOWEgNkefb2Dz3V4RuNgJHyHIOqeaLgIbk7Mg
 92bFhbBpBuNNMuaiRx0dSdFQOCm/j5uFlFmA+ge4KLdWIOR8R5WSy9Gk6Idt5TuIGXUZJLMfT
 DMI8JSDIgtUNi5iIONRhy+ZvTNQaE7VBTqEIZCIAa01NOyOwgBrrLPKS+TQ0aD/2CUNLLNuFe
 4YAVZfJWx+Y+d2chFSaXuwUc+MdVz7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_153214_025597_67A9809F 
X-CRM114-Status: GOOD (  12.81  )
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
Message-ID: <20210407143144.FRkNxr6YLTebFC1oEFbzHK7jzs2x6iQp8_C-q7BhAhY@z>

On Sat, Apr 3, 2021 at 5:06 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Hi ARM-SoC team,
>
> Please consider to pull the following changes.
> Thanks!

I'd prefer to not break compatibility of old kernels with new dts files
here, as this would prevent installing an old distro with an ebbr
compliant boot loader, for purely cosmetic reasons.  These are used
in the popular 'hikey' boards, which are used in many scenarios,
which makes it fairly likely that someone might want to install
something other than the very latest kernel.

Could you instead keep both the old and the new property in there
for at least a few years?

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
