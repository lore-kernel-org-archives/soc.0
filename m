Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E90C433B4
	for <linux-devicetree@archiver.kernel.org>; Wed, 21 Apr 2021 06:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 418C761426
	for <linux-devicetree@archiver.kernel.org>; Wed, 21 Apr 2021 06:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhDUGdB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 21 Apr 2021 02:33:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:47983 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhDUGdB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Apr 2021 02:33:01 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7s1M-1lUASP1SRW-004x96 for <devicetree@vger.kernel.org>; Wed, 21 Apr
 2021 08:32:27 +0200
Received: by mail-wr1-f41.google.com with SMTP id c4so1133190wrt.8
        for <devicetree@vger.kernel.org>; Tue, 20 Apr 2021 23:32:27 -0700 (PDT)
X-Gm-Message-State: AOAM530lLjoGEH38sUeKKSMuOjfbIzZbGcw5v7hoT0JGLseFI2mXZRpx
        wj9kK3WsvLtRp+p4YCLocfpu4KUkFGpnmkVvQ14=
X-Google-Smtp-Source: ABdhPJz8KQSQMuG/h3FrLd/30pB27ABNbzxI+tJP3O1/oI7h1c5S/4lxz8O5iRBe9dLjnXhf6FKlZ1EzgS+Z6bRkkoQ=
X-Received: by 2002:adf:e483:: with SMTP id i3mr25900890wrm.286.1618986747076;
 Tue, 20 Apr 2021 23:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210420230402.8807-1-khilman@baylibre.com>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 21 Apr 2021 08:32:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2bJL732XttLnjRH_1TA3EpuVaPyBDD0NbhbCO0WmqcNw@mail.gmail.com>
Message-ID: <CAK8P3a2bJL732XttLnjRH_1TA3EpuVaPyBDD0NbhbCO0WmqcNw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
To:     Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:ARM/Amlogic Meson SoC support" 
        <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EmFVc8J2HA7NQQKeLT5uy7erRYJ1kzUYeugBWsy7xlr0ClPq7id
 1nXRsEQQIRk0XhlBPaL4GoiFs8TzDp19gfPOc4otLNGzfhTPPoi8eCcu4ia3Rsqo3WggLNq
 PYWWHy0ON/NME2rC8B+lO2xK/F9d0jwEUpD2ghHPVfIbExHef2uWKJrVFAQqQpNfUkKePVD
 asLcyzcGNZmWJIGCvoHvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cSuANd85X2I=:meyqZjHBsCJjvJDP3Iy1DJ
 SHEWY5pINFf86CD4XhrqAxtXnzudfFOTt2Vx5V5OB3h239GGJ+5yrnM+yiWdmRUZ32tMDJud5
 1a7I8z06r2PTpRJhnJE0kWHpNFq4/yp1R8qQFySaZvVSC24IKw0FHTWuTVRSxAnMbItfxkBYB
 ra0qtLFwYezvFF/flYgU+g4qifWM5fqSqhRN6k+9CKfrcbQqRtrvPNpVigQa2N5OVt6q1+gE2
 djTPjkPpDQmvDrOg6K3tGwrDgpavlu6zPo1NVGsDmXK996tt50tbwRHx4YJ3jSQcDA/zb+BTx
 imyg0Qd1362KSWk0K8H++y5MOQCwNtUn+p0TCm2xa8rx1RDZabBU4dpuDW05XstKuF5JB5hKX
 aF9dCBfx8Ibekye1oUZYZnuSYIOFIu5CUU6dohQopvj/pHS5F4L8H76g2bOZvUv04pbjwvh6H
 2AXk9N0nkHf/KEMTMwU6HmjOJL6OPstwddBR3JZyYZYeTrMBnNNxDBdKPT6ZfDSBqgtqns4tX
 9c85P5hnI8hXE+1kDVhBT0=
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 21, 2021 at 1:04 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

Thank you for addressing these. If Rob or someone else can review them
and confirm that they all look good, I'll apply them on top of the branch
I already have for 5.13.

     Arnd
