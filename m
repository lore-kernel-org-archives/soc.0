Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F303E1205
	for <soc@lists.linux.dev>; Tue, 14 Apr 2026 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179589; cv=none; b=e2qrxdFlrKyf0d7pa64JCSe8OOEUaM0RmiblY5IyrMrOE8m3TOTLCYXZg1NWg53TE6hqqhm6ozqoBOigNVdez1ZvEAyEtm7SRGQL8loawzj4UIMglT6U99gzuQJBsCXCm4xKRUADP43MQMKx2eeM9H70QUM2c5gIhZ1IFrIDF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179589; c=relaxed/simple;
	bh=jlBqn/ZtKob0vrIMlPObD7HW2yJmEoTdBgvCqpUNNJE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YmSDn+Y4AofC+lO+sZ2FCaQqO0rSz9Mk4KFaJa2o9go5V5VqV4bZuwvJ5EXRLKYAZ8im5geQTLEMhxyhIYjizFpDJM6l0XAHyJ+k/Ffh5JbMflrukwBZ9ug/wcbsIyXBV2jE9FDGDFqYockJ2/H2stul6R/jJwersUFbRqNhZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO5ICNzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO5ICNzK"
Received: by smtp.kernel.org (Postfix)
	id 84CDAC2BCB5; Tue, 14 Apr 2026 15:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E47C19425;
	Tue, 14 Apr 2026 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776179589;
	bh=jlBqn/ZtKob0vrIMlPObD7HW2yJmEoTdBgvCqpUNNJE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=MO5ICNzKNYEe3D1NTkv1owcdL4/oULa3uNtlx8jv2d0hLaLTh9NabkvG6d14ekR4J
	 p2XN66gvS8PYLdMilyGhHpIrZGR2RcrzLrsyRg/g2GOSmtqJAn6NjRHhPAy4Ts+AoD
	 bF3MW5JBCfamiDecuc2qGtRMCUvcOqaMvGFUjPyuM+9aGSgZHTHYdmnlpXtbYHJ4F/
	 TgBbzSldnoy9FLyLahNo3iedXsNp+NUzoMjfEpQJeSS8DQK5HFijhn292PZ3TOL6Vx
	 caoDjp42+GdfbLhhA0wCfoZJ0fvJvDHA79mVzno2tveSZej/YubWKYqN9ryhS8gKwg
	 /jblAf8nUv8jg==
Message-ID: <2755af3f-d7d6-49b8-88f5-66352c237c35@kernel.org>
Date: Tue, 14 Apr 2026 17:13:05 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] SOC FSL for 6.20
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
References: <69cdadd6-523c-4a79-8cb3-1deff5910699@kernel.org>
 <f48af0d1-0980-46dd-b2e9-081b019381e2@app.fastmail.com>
 <a7d13f9e-7a95-4464-abe8-c095354f9908@kernel.org>
Content-Language: fr-FR
In-Reply-To: <a7d13f9e-7a95-4464-abe8-c095354f9908@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 14/04/2026 à 17:02, Christophe Leroy (CS GROUP) a écrit :
> 
> 
> Le 14/04/2026 à 16:55, Arnd Bergmann a écrit :
>> On Tue, Apr 14, 2026, at 16:08, Christophe Leroy (CS GROUP) wrote:
>>> Hi Arnd,
>>>
>>> Please pull the following Freescale Soc Drivers changes for 7.1
>>>
>>> Changes to fsl-mc bus are reviewed or acked by Ioana Ciornei.
>>
>> Hi Christophe,
>>
>> This is really too late for 7.1: the merge window is
>> already open, and I see that all the commits have a committer
>> date of today, though some appear to be freshly rebased
>> and had an earlier version in linux-next.
>>
>> I don't think any of these are urgent bugfixes, so I'd
>> suggest you rebase onto 7.1-rc1 and send these again for
>> 7.2.
> 
> Uhm .... Maybe I made it wrong. All those changes have spent quite some 
> time in linux-next but the branch was based on the tag soc_fsl-7.0-2 
> that you merged into 7.0-rc5.
> This morning I fetched soc tree and saw that the soc/driver branch was 
> based on rc1, so to avoid pulling 7.0-rc5 I rebased the changes on 7.0-rc1.
> 
> Should I restore the original branch as it was in Linux-next until this 
> morning and send a new pull request ?
> 

FWIW, here is the log of the original branch as it was in linux next 
until this morning before the rebase, with commit dates:

commit 208858b1b48eba83d073542372329cf8ed606526
Author:     Ioana Ciornei <ioana.ciornei@nxp.com>
AuthorDate: Wed Apr 1 17:45:08 2026 +0300
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Sat Apr 4 18:54:05 2026 +0200

     bus: fsl-mc: wait for the MC firmware to complete its boot

     There are use cases in which the Management Complex firmware boot
     process is started by the bootloader which does not wait for the 
boot to
     complete. This is mainly done in order to reduce the overall boot time
     of a DPAA2 based SoC.

     In this kind of circumstance, the fsl-mc bus driver needs to make sure
     that the MC firmware boot process is finished before proceeding to the
     usual operations such as interrogating the firmware to gather all
     existent DPAA2 objects, creating the fsl-mc devices on the bus etc.

     Add this kind of check early in the boot process of the fsl-mc bus and
     defer the probe in case the firmware is still in its boot process.

     Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Link: 
https://lore.kernel.org/r/20260401144508.3062019-1-ioana.ciornei@nxp.com
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit a0fe29d20e7822182e12324905af5115c1b3aed3
Author:     Wang Jun <1742789905@qq.com>
AuthorDate: Fri Mar 27 08:12:25 2026 +0800
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Sat Apr 4 18:52:09 2026 +0200

     soc: fsl: qe: panic on ioremap() failure in qe_reset()

     When ioremap() fails in qe_reset(), the global pointer qe_immr remains
     NULL, leading to a subsequent NULL pointer dereference when the pointer
     is accessed. Since this happens early in the boot process, a failure to
     map a few bytes of I/O memory indicates a fatal error from which the
     system cannot recover.

     Follow the same pattern as qe_sdma_init() and panic immediately when
     ioremap() fails. This avoids a silent NULL pointer dereference later
     and makes the error explicit.

     Fixes: 986585385131 ("[POWERPC] Add QUICC Engine (QE) infrastructure")
     Cc: stable@vger.kernel.org
     Signed-off-by: Wang Jun <1742789905@qq.com>
     Link: 
https://lore.kernel.org/r/tencent_FED49CF5331CC0C7910618883332A08E2606@qq.com
     [chleroy: Rearranged change to reduce churn]
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 7b9233b25131fa54ef9c64ebbe95aef6ad3de47c
Author:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
AuthorDate: Tue Mar 24 23:34:16 2026 +0100
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Wed Mar 25 11:24:07 2026 +0100

     soc: fsl: qe_ports_ic: switch to irq_domain_create_linear()

     irq_domain_add_linear() is about to be removed, replace by the
     more generic irq_domain_create_linear(),
     see commit 42b8b16fe56c ("irqdomain: Drop irq_domain_add_*()
     functions") for details.

     Link: 
https://lore.kernel.org/r/a9de2f351ea71e4b794baaea8d9d790fbfac8d26.1774391374.git.chleroy@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 7dad18a179741dbad9f40799e549fa9111987c0c
Author:     Felix Gu <ustc.gu@gmail.com>
AuthorDate: Tue Mar 10 00:25:30 2026 +0800
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Fri Mar 13 10:13:55 2026 +0100

     soc: fsl: qe_ports_ic: Add missing cleanup on device removal

     Add a devm action handler to properly clean up the irq_domain and
     chained handler when the device is removed.

     Fixes: f0bcd784e1b7 ("soc: fsl: qe: Add an interrupt controller for 
QUICC Engine Ports")
     Signed-off-by: Felix Gu <ustc.gu@gmail.com>
     Link: 
https://lore.kernel.org/r/20260310-qe_ports_ic-v1-1-608293026561@gmail.com
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit cf8e9203cc653f0a82639f7ce8089fa92afe6739
Author:     Randy Dunlap <rdunlap@infradead.org>
AuthorDate: Thu Feb 26 14:09:42 2026 -0800
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Fri Feb 27 07:28:08 2026 +0100

     virt: fsl_hypervisor: fix header kernel-doc warnings

     Correct struct member names to placate kernel-doc warnings:

     Warning: include/uapi/linux/fsl_hypervisor.h:148 struct member
      'local_vaddr' not described in 'fsl_hv_ioctl_memcpy'
     Warning: include/uapi/linux/fsl_hypervisor.h:148 struct member
      'remote_paddr' not described in 'fsl_hv_ioctl_memcpy'

     Fixes: 6db7199407ca ("drivers/virt: introduce Freescale hypervisor 
management driver")
     Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
     Link: 
https://lore.kernel.org/r/20260226220942.1035295-1-rdunlap@infradead.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit f0a2eac6a597268034fd40d92c1469182438b53d
Author:     Marc Zyngier <maz@kernel.org>
AuthorDate: Tue Feb 24 10:09:36 2026 +0000
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Thu Feb 26 10:48:19 2026 +0100

     platform-msi: Remove stale comment

     The backward compatibility code for the previous incarnation of
     platform MSI was removed in e9894248994ca ("genirq/msi: Remove
     platform MSI leftovers"), but the comment about that removal is
     still present.  Remove it.

     Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, 
LS2088ARDB
     Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
     Signed-off-by: Marc Zyngier <maz@kernel.org>
     Acked-by: Thomas Gleixner <tglx@kernel.org>
     Link: https://lore.kernel.org/r/20260224100936.3752303-7-maz@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 14b1cbcc6cec0b02298f4adf717646cd943b7ef6
Author:     Marc Zyngier <maz@kernel.org>
AuthorDate: Tue Feb 24 10:09:35 2026 +0000
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Thu Feb 26 10:48:18 2026 +0100

     fsl-mc: Remove legacy MSI implementation

     Get rid of most of the fsl_mc MSI infrastructure, which is now replaced
     by common code.

     Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, 
LS2088ARDB
     Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
     Signed-off-by: Marc Zyngier <maz@kernel.org>
     Acked-by: Thomas Gleixner <tglx@kernel.org>
     Link: https://lore.kernel.org/r/20260224100936.3752303-6-maz@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 4a958e47c246fa3fb8954f4303e0da15ab3d026d
Author:     Marc Zyngier <maz@kernel.org>
AuthorDate: Tue Feb 24 10:09:34 2026 +0000
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Thu Feb 26 10:48:18 2026 +0100

     fsl-mc: Switch over to per-device platform MSI

     Obtain the msi-parent irqdomain instead of the fsl_mc domain,
     which magically engages the per-device infrastructure.

     Additionally, simplify the overly complicated error handling.

     Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, 
LS2088ARDB
     Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
     Signed-off-by: Marc Zyngier <maz@kernel.org>
     Acked-by: Thomas Gleixner <tglx@kernel.org>
     Link: https://lore.kernel.org/r/20260224100936.3752303-5-maz@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit cf3179b4e53f527aba9f0c6c3b921619c8adf761
Author:     Marc Zyngier <maz@kernel.org>
AuthorDate: Tue Feb 24 10:09:33 2026 +0000
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Thu Feb 26 10:48:18 2026 +0100

     irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent 
handling

     Make the ITS code aware of fsl_mc devices by plumbing the devid
     retrieval primitive.

     Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, 
LS2088ARDB
     Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
     Signed-off-by: Marc Zyngier <maz@kernel.org>
     Acked-by: Thomas Gleixner <tglx@kernel.org>
     Link: https://lore.kernel.org/r/20260224100936.3752303-4-maz@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 0c9f522f2d41c7e055a602a0d2c41dc7af01010b
Author:     Marc Zyngier <maz@kernel.org>
AuthorDate: Tue Feb 24 10:09:32 2026 +0000
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Thu Feb 26 10:48:18 2026 +0100

     fsl-mc: Add minimal infrastructure to use platform MSI

     Add the tiny bit of infrastructure required to use platform MSI
     instead of the current hack. This means providing a write_msi_msg
     callback, as well as irq domain and devid retrieval helpers.

     Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, 
LS2088ARDB
     Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
     Signed-off-by: Marc Zyngier <maz@kernel.org>
     Acked-by: Thomas Gleixner <tglx@kernel.org>
     Link: https://lore.kernel.org/r/20260224100936.3752303-3-maz@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 1fb7392ee3408494d4d62c09a8c3e5f5934caba7
Author:     Marc Zyngier <maz@kernel.org>
AuthorDate: Tue Feb 24 10:09:31 2026 +0000
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Thu Feb 26 10:48:18 2026 +0100

     fsl-mc: Remove MSI domain propagation to sub-devices

     Only the root device generates MSIs (it is the only one talking to
     the ITS), so propagating the domain is pretty pointless. Remove it.

     Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
     Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, 
LS2088ARDB
     Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
     Signed-off-by: Marc Zyngier <maz@kernel.org>
     Acked-by: Thomas Gleixner <tglx@kernel.org>
     Link: https://lore.kernel.org/r/20260224100936.3752303-2-maz@kernel.org
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 3f4e403304186d79fddace860360540fc3af97f9
Author:     Chen Ni <nichen@iscas.ac.cn>
AuthorDate: Mon Feb 9 09:59:04 2026 +0800
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Mon Feb 23 14:49:27 2026 +0100

     soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in 
qmc_qe_init_resources()

     Fix wrong variable used for error checking after 
devm_ioremap_resource()
     call. The function checks qmc->scc_pram instead of qmc->dpram, which
     could lead to incorrect error handling.

     Fixes: eb680d563089 ("soc: fsl: cpm1: qmc: Add support for QUICC 
Engine (QE) implementation")
     Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
     Acked-by: Herve Codina <herve.codina@bootlin.com>
     Link: 
https://lore.kernel.org/r/20260209015904.871269-1-nichen@iscas.ac.cn
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 014077044e874e270ec480515edbc1cadb976cf2
Author:     Richard Genoud <richard.genoud@bootlin.com>
AuthorDate: Tue Dec 23 08:25:49 2025 +0100
Commit:     Christophe Leroy (CS GROUP) <chleroy@kernel.org>
CommitDate: Mon Feb 23 14:49:27 2026 +0100

     soc: fsl: qbman: fix race condition in qman_destroy_fq

     When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
     fq_table[fq->idx] state and freeing/allocating from the pool and
     WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.

     Indeed, we can have:
              Thread A                             Thread B
         qman_destroy_fq()                    qman_create_fq()
           qman_release_fqid()
             qman_shutdown_fq()
             gen_pool_free()
                -- At this point, the fqid is available again --
                                                qman_alloc_fqid()
                -- so, we can get the just-freed fqid in thread B --
                                                fq->fqid = fqid;
                                                fq->idx = fqid * 2;
                                                WARN_ON(fq_table[fq->idx]);
                                                fq_table[fq->idx] = fq;
          fq_table[fq->idx] = NULL;

     And adding some logs between qman_release_fqid() and
     fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.

     To prevent that, ensure that fq_table[fq->idx] is set to NULL before
     gen_pool_free() is called by using smp_wmb().

     Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
     Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
     Tested-by: CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>
     Link: 
https://lore.kernel.org/r/20251223072549.397625-1-richard.genoud@bootlin.com
     Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
Author:     Linus Torvalds <torvalds@linux-foundation.org>
AuthorDate: Sun Feb 22 13:18:59 2026 -0800
Commit:     Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: Sun Feb 22 13:18:59 2026 -0800

     Linux 7.0-rc1


